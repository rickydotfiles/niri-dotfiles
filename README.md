# niri-noctalia dotfiles

My personal Linux setup — a Wayland tiling compositor rice using [niri](https://github.com/YaLTeR/niri) with a [Noctalia](https://github.com/noctalia-dev/noctalia) bar/wallpaper/notification setup, on Void Linux with a pink/rose theme.

## Table of contents

- [Overview](#overview)
- [Screenshots](#screenshots)
- [Repository layout](#repository-layout)
- [Dependencies](#dependencies)
- [Manual installation](#manual-installation)
  - [1. Cloning](#1-cloning)
  - [2. Configuration files](#2-configuration-files)
  - [3. Final steps](#3-final-steps)
- [Automated installation](#automated-installation)
- [Keybindings](#keybindings)
- [Notes / customization](#notes--customization)

## Overview

- **OS:** Void Linux (glibc)
- **Compositor:** [niri](https://github.com/YaLTeR/niri) (Wayland)
- **Bar/Theme/UI:** [Noctalia](https://github.com/noctalia-dev/noctalia) (compiled from source in this setup; also available on AUR)
- **Terminal:** [ghostty](https://github.com/ghostty-org/ghostty) (transparent, with Noctalia theme)
- **Shell:** [zsh](https://www.zsh.org/) (custom prompt, fzf, keybinds)
- **Launcher:** [rofi](https://github.com/davatorium/rofi)
- **Status Monitor:** [btop](https://github.com/aristocratos/btop)
- **System Info:** [fastfetch](https://github.com/fastfetch-cli/fastfetch) (custom ASCII art)
- **Editor:** [Neovim](https://neovim.io/) (vim-plug, Lua config)
- **File Manager:** [nnn](https://github.com/jarun/nnn)
- **Compositor effects:** [picom](https://github.com/yshui/picom)
- **Theme:** Noctalia pink/rose palette across GTK, rofi, btop, ghostty, vesktop, qutebrowser, and more

## Screenshots

<table>
  <tr>
    <td rowspan="3" width="60%">
      <img src="ScreenShots%20and%20Videos/ex1.png" alt="Screenshot 1" />
    </td>
    <td width="40%">
      <img src="ScreenShots%20and%20Videos/ex2.png" alt="Screenshot 2" />
    </td>
  </tr>
  <tr>
    <td>
      <img src="ScreenShots%20and%20Videos/ex3.png" alt="Screenshot 3" />
    </td>
  </tr>
  <tr>
    <td>
      <img src="ScreenShots%20and%20Videos/ex4.png" alt="Screenshot 4" />
    </td>
  </tr>
  <tr>
    <td>
      <img src="ScreenShots%20and%20Videos/ex5.png" alt="Screenshot 5" />
    </td>
    <td>
      <img src="ScreenShots%20and%20Videos/ex6.png" alt="Screenshot 6" />
    </td>
  </tr>
</table>

## Repository layout

```text
dotfiles/
├── .config/
│   ├── niri/              # niri config (config.kdl, noctalia.kdl)
│   ├── noctalia/          # Noctalia-related files (theme fragments)
│   ├── ghostty/           # ghostty config + Noctalia theme
│   ├── nvim/              # Neovim config (init.lua + lua/ plugins/config)
│   ├── rofi/              # rofi configs and themes
│   ├── btop/              # btop config and Noctalia theme
│   ├── fastfetch/         # fastfetch config + custom ASCII arts
│   ├── gtk-3.0/           # GTK3 settings + Noctalia theme
│   ├── gtk-4.0/           # GTK4 settings + Noctalia theme
│   ├── fzf/               # fzf themes
│   ├── vesktop/           # vesktop themes (no session data)
│   ├── qutebrowser/       # qutebrowser Noctalia files
│   ├── cava/              # cava config
│   ├── picom/             # picom config
│   ├── nnn/               # nnn config
│   ├── opencode/          # opencode config
│   └── mimeapps.list      # default apps
├── .local/
│   └── bin/               # custom scripts (rofi-share-picker, vesktop-aec, status/*)
├── .zshrc                 # zsh config
├── .zprofile              # login shell env + niri autostart on tty1
├── .gitconfig             # git user config
├── .xinitrc               # X11 fallback startup
├── .inputrc               # readline config
├── .gitignore             # ignores for caches/logs/secrets
└── README.md
```

## Dependencies

Install these via your package manager. Package names are given for Void Linux (xbps); adapt for Arch/others.

### Core (Wayland/WM)
- `niri` - Wayland compositor
- `noctalia` - Bar/wallpaper/notifications (build from source or `noctalia` from AUR)
- `wayland`, `wayland-protocols`, `wlroots` (usually pulled as deps)
- `dbus`, `seatd`, `polkit` (session/permissions)

### Terminal & shell
- `ghostty` - Terminal
- `zsh` - Shell
- `zsh-syntax-highlighting` - Syntax highlighting for zsh
- `fzf` - Fuzzy finder

### Apps & utilities
- `rofi` - Launcher
- `btop` - System monitor
- `fastfetch` - System info
- `nnn` - File manager
- `picom` - Compositor
- `cava` - Audio visualizer
- `dunst` or use Noctalia notifications
- `wireplumber`, `pipewire` - Audio
- `wl-clipboard`, `cliphist` - Clipboard (if used)
- `feh` - Wallpaper (if needed)
- `playerctl` - Media control
- `networkmanager`/`iwd` - Networking

### Fonts & icons
- `nerd-fonts-jetbrains-mono` or `ttf-jetbrains-mono-nerd` - Primary font (you're using JetBrainsMono NF)
- A GTK icon/cursor theme (e.g. `Moga-Pink` is referenced in niri config)

### Development/tools
- `neovim` - Editor
- `git`, `curl`
- `nodejs`, `pnpm` (if using with your setup)

## Manual installation

### 1. Cloning

```bash
git clone https://github.com/<your-username>/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 2. Configuration files

You can symlink everything with [GNU Stow](https://www.gnu.org/software/stow/) (recommended), or copy manually.

#### Using Stow (recommended)

```bash
# From inside the dotfiles repo
stow .
```

This will symlink all files to their correct locations in your home directory.

#### Manual symlinking

```bash
# Configs
ln -sf ~/dotfiles/.config/niri ~/.config/
ln -sf ~/dotfiles/.config/ghostty ~/.config/
ln -sf ~/dotfiles/.config/nvim ~/.config/
ln -sf ~/dotfiles/.config/btop ~/.config/
ln -sf ~/dotfiles/.config/rofi ~/.config/
ln -sf ~/dotfiles/.config/fastfetch ~/.config/
ln -sf ~/dotfiles/.config/gtk-3.0 ~/.config/
ln -sf ~/dotfiles/.config/gtk-4.0 ~/.config/
ln -sf ~/dotfiles/.config/fzf ~/.config/
ln -sf ~/dotfiles/.config/vesktop ~/.config/
ln -sf ~/dotfiles/.config/qutebrowser ~/.config/
ln -sf ~/dotfiles/.config/cava ~/.config/
ln -sf ~/dotfiles/.config/picom ~/.config/
ln -sf ~/dotfiles/.config/nnn ~/.config/
ln -sf ~/dotfiles/.config/opencode ~/.config/
ln -sf ~/dotfiles/.config/mimeapps.list ~/.config/

# Shell & misc
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.zprofile ~/.zprofile
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.xinitrc ~/.xinitrc
ln -sf ~/dotfiles/.inputrc ~/.inputrc

# Scripts
mkdir -p ~/.local/bin
ln -sf ~/dotfiles/.local/bin/* ~/.local/bin/ 2>/dev/null
```

### 3. Final steps

1. **Install fonts** - Make sure JetBrainsMono Nerd Font is installed.
2. **Install dependencies** - Install all packages listed above for your distro.
3. **Configure Noctalia** - This repo only includes theme fragments for various apps. If you installed Noctalia from AUR/source, you'll need to configure your bar modules, widgets, and layout through Noctalia's own config/UI. The colors will match, but your layout may differ.
4. **Set up shell** - If you use zsh, set it as your default shell (`chsh -s $(which zsh)`). Your `.zprofile` will autostart niri on tty1.
5. **Neovim plugins** - On first launch of `nvim`, vim-plug will auto-install plugins as configured in `init.lua`.
6. **Check paths** - Review `.zshrc`, `.zprofile`, and scripts in `.local/bin/` for any hardcoded paths that might need adjusting for your system.

## Automated installation

If you want something similar to the automated setup from other rices, you can write your own install script. For now, the manual/stow method above is recommended.

## Keybindings

niri keybindings are defined in `~/.config/niri/config.kdl`. A few notable ones:

| Keybind | Action |
| --- | --- |
| `Super + Return` | Open terminal (ghostty) |
| `Super + D` / Launcher | Open rofi (see niri config for exact binding) |
| `Super + Q` | Close window |
| `Super + H/J/K/L` | Focus window/movement |
| `Super + Shift + H/J/K/L` | Move window |
| `Super + 1-9` | Switch workspace |
| `Super + Shift + 1-9` | Move window to workspace |
| `Super + F` | Fullscreen |
| `Super + V` | Toggle floating |

Check `~/.config/niri/config.kdl` for the complete and up-to-date keybindings.

## Notes / customization

- **Noctalia themes** - The Noctalia color scheme is applied across many apps via theme files in their respective configs. If you switch Noctalia themes, you'll need to regenerate/update these theme files or adjust them manually.
- **Portability** - This rice is built on Void Linux. On Arch (AUR Noctalia) or other distros, most configs will work, but you may need to adjust paths (e.g. zsh plugin locations) and package names.
- **Neovim** - Uses vim-plug. If you prefer lazy.nvim or another manager, you'll need to migrate. Plugin state isn't tracked.
- **Shell config** - `.zshrc` sources optional files like `~/.config/shell/alias` and `~/.config/shell/vars` if they exist. Create them if you need custom aliases/vars.
- **GTK theme** - `Moga-Pink` cursor theme is referenced; install it or change it in `niri/config.kdl` and GTK settings.
- **Scripts** - Custom scripts in `.local/bin/` may depend on tools like `wpctl`, `playerctl`, etc. Make sure they're installed.

## Notes on first use

- **Git identity**: The included `.gitconfig` has placeholder values. Update them with `git config --global user.name "Your Name"` and `git config --global user.email "you@example.com"`, or edit `~/.gitconfig` after installation.
- **niri autostart**: `.zprofile` will automatically start niri on `tty1` if no display server is running. If you use a display manager or a different session, comment this out.
- **Fonts & cursors**: Install a Nerd Font (e.g. JetBrainsMono Nerd Font) and your preferred cursor/icon themes. Update `cursor { xcursor-theme ... }` in `~/.config/niri/config.kdl` if needed.
- **Noctalia**: Only theme fragments are included. If you installed Noctalia via AUR/source, configure your bar layout/widgets through Noctalia itself - colors will match but the layout won't be identical to this rice.

## Videos

[![Video demo 1](https://img.shields.io/badge/Video-Demo%201-ff69b4)](<ScreenShots and Videos/vid-ex1.mp4>)

[![Video demo 2](https://img.shields.io/badge/Video-Demo%202-ff69b4)](<ScreenShots and Videos/vid-ex2.mp4>)

<video src="ScreenShots%20and%20Videos/vid-ex1.mp4" controls width="100%"></video>

<video src="ScreenShots%20and%20Videos/vid-ex2.mp4" controls width="100%"></video>
