# Dotfiles

Personal dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## Contents

- **fish** - Fish shell configuration
- **tmux** - Terminal multiplexer config
- **neovim** - Neovim (LazyVim) configuration
- **git** - Git aliases and settings
- **hypr** - Hyprland compositor config (Linux only)

## Setup

### First Time Setup

Install chezmoi and apply dotfiles:

```bash
# On Arch Linux
yay -S chezmoi

# On macOS
brew install chezmoi

# Initialize from this repo
chezmoi init https://github.com/YOUR_USERNAME/dotfiles.git

# Preview changes
chezmoi diff

# Apply dotfiles
chezmoi apply
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
- Fish config is marked private to prevent accidental exposure of sensitive data
