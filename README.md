# dotfiles

My personal rice running on Void Linux with:
- [niri](https://github.com/YaLTeR/niri) - Wayland compositor
- [noctalia](https://github.com/noctalia-dev/noctalia) - Status bar/wallpaper/notifications (compiled from source)
- [ghostty](https://github.com/ghostty-org/ghostty) - Terminal emulator
- [neovim](https://neovim.io/) - Editor (with vim-plug)
- [rofi](https://github.com/davatorium/rofi) - App launcher
- [btop](https://github.com/aristocratos/btop) - System monitor
- [zsh](https://www.zsh.org/) - Shell
- [fastfetch](https://github.com/fastfetch-cli/fastfetch) - System info

## Structure

This repo mirrors my home directory structure. Use symlinks or a tool like [stow](https://www.gnu.org/software/stow/) to deploy.

## Setup

```bash
# Clone
git clone git@github.com:yourusername/dotfiles.git ~/dotfiles

# Using GNU stow
cd ~/dotfiles
stow .

# Or manually symlink
ln -sf ~/dotfiles/.config/niri ~/.config/
ln -sf ~/dotfiles/.config/ghostty ~/.config/
ln -sf ~/dotfiles/.config/nvim ~/.config/
ln -sf ~/dotfiles/.config/btop ~/.config/
ln -sf ~/dotfiles/.config/rofi ~/.config/
ln -sf ~/dotfiles/.config/fastfetch ~/.config/
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.zprofile ~/.zprofile
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.xinitrc ~/.xinitrc
ln -sf ~/dotfiles/.inputrc ~/.inputrc
```

## Notes

- `noctalia/` theme files are spread across various apps (btop, rofi, ghostty, gtk, etc.)
- Custom scripts in `.local/bin/`
- Neovim uses vim-plug and will auto-install on first run
- Shell expects XDG directories as set in `.zprofile`
