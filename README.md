# Dotfiles

Personal dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## Contents

- **fish** - Fish shell configuration with vim keybindings
- **tmux** - Terminal multiplexer config with Tokyo Night theme
- **neovim** - Neovim (LazyVim) configuration
- **git** - Git aliases and settings
- **starship** - Cross-shell prompt
- **hypr** - Hyprland compositor config (Linux only)
- **aerospace** - Window manager config (macOS only)
- **sketchybar** - Status bar config (macOS only)

## Setup

### First Time Setup

Install chezmoi and apply dotfiles:

```bash
# On macOS
curl -fsSL https://raw.githubusercontent.com/aidan-starke/dotfiles/main/install-macos.sh | bash

# On Arch Linux
yay -S chezmoi

# On macOS
brew install chezmoi

# Initialize from this repo
chezmoi init https://github.com/aidan-starke/dotfiles.git

# Preview changes
chezmoi diff

# Apply dotfiles
chezmoi apply

# Open tmux and install plugins with: prefix + I
# Open Neovim - lazy.nvim will install plugins, Mason will install LSPs
```

### Updating

```bash
# Pull latest changes
chezmoi update

# Or manually
chezmoi git pull
chezmoi apply
```

### Making Changes

```bash
# Edit a config file
chezmoi edit ~/.config/fish/config.fish

# Or edit directly and add changes
vim ~/.config/fish/config.fish
chezmoi add ~/.config/fish/config.fish

# Commit and push
chezmoi cd
git add .
git commit -m "Update fish config"
git push
```

## Platform-Specific Notes

- **hypr** config is automatically excluded on non-Linux systems via `.chezmoiignore`
- **aerospace** and **sketchybar** configs are automatically excluded on non-macOS systems via `.chezmoiignore`
- All paths use `$HOME` for cross-platform compatibility
