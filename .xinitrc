#!/bin/sh
# X session entrypoint (startx / xinit). Void + runit, so no systemd -- the
# session bus and the PipeWire stack are started here.

# --- D-Bus session bus -----------------------------------------------------
# Needed by GTK apps, notifications, gvfs, polkit prompts, etc. The runit
# `dbus` service only provides the *system* bus, so the session bus has to be
# brought up here. Guarded in case you launch via dbus-run-session.
if [ -z "${DBUS_SESSION_BUS_ADDRESS:-}" ]; then
	eval "$(dbus-launch --sh-syntax)"
	export DBUS_SESSION_BUS_ADDRESS
fi
# dbus-launch exits after forking the daemon, leaving this pid stale. Clearing
# it stops clients from trying to manage a process that no longer exists.
unset DBUS_SESSION_BUS_PID

# --- Audio: PipeWire + WirePlumber ------------------------------------------
# There are no runit services for these, so they start with the session.
# Guarded with pgrep so restarting X without logging out doesn't spawn dupes.
if ! pgrep -u "$(id -u)" -x pipewire >/dev/null 2>&1; then
	pipewire &
	# WirePlumber only wires itself up once the PipeWire daemon is listening.
	sleep 0.5
	wireplumber &
fi

# PulseAudio shim, for apps that still speak the pulse protocol.
if ! pgrep -u "$(id -u)" -x pipewire-pulse >/dev/null 2>&1; then
	pipewire-pulse &
fi

# --- X server / display defaults -------------------------------------------
# Laptop panel off, DP-1 primary, HDMI-1 to its left. Names must match
# `xrandr --query` or nothing gets applied.
xrandr \
	--output eDP-1 --off \
	--output DP-1 --mode 1920x1080 --rate 60 --primary \
	--output HDMI-1 --mode 1920x1080 --rate 75 --left-of DP-1

xrandr --output HDMI-1 --set "Broadcast RGB" "Full" 2>/dev/null

# No screen saver, no blanking, no DPMS power-off on idle.
xset s off
xset -dpms
xset s noblank

# --- Compositor ------------------------------------------------------------
# Picks up ~/.config/picom/picom.conf automatically. Guarded with pgrep so
# restarting X without logging out doesn't spawn dupes.
if ! pgrep -u "$(id -u)" -x picom >/dev/null 2>&1; then
	picom &
fi

# --- Wallpaper -------------------------------------------------------------
feh --bg-fill "$HOME/Pictures/Wallpapers/sanae.jpg"

# --- Status bar ------------------------------------------------------------
# /usr/local/bin/dwmblocks is dwmblocks-async. It talks to the X server rather
# than a dwm socket, so it is fine to start before dwm itself. Its block
# scripts live in ~/.local/bin/status/.
if ! pgrep -u "$(id -u)" -x dwmblocks >/dev/null 2>&1; then
	dwmblocks &
fi

exec dwm
