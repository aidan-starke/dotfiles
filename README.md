# Dotfiles

Personal dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## Contents

- **fish** - Fish shell configuration with vim keybindings
- **herdr** - Terminal multiplexer config with Tokyo Night theme (auto-launched by fish)
- **neovim** - Neovim (LazyVim) configuration
- **git** - Git aliases and settings
- **starship** - Cross-shell prompt
- **hypr** - Hyprland compositor config (Linux only, opt-in)
- **DankMaterialShell** - DMS settings and Tokyo Night theme (Linux only, opt-in with hypr)
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

# Configure machine-specific settings (GPG signing key, opt-in hypr config)
cat > ~/.config/chezmoi/chezmoi.toml << EOF
[data]
    hypr = false  # set to true on machines that should receive ~/.config/hypr and DMS settings

[data.git]
    signingkey = "YOUR_GPG_KEY_ID_HERE"
EOF

# Create secrets file for API keys (not tracked in git)
cat > ~/.config/fish/conf.d/secrets.fish << EOF
# API Keys and Secrets
set -gx ANTHROPIC_API_KEY your_key_here
EOF

# Preview changes
chezmoi diff

# Apply dotfiles
chezmoi apply

# Make sure herdr is installed at ~/.local/bin/herdr (fish auto-launches it)
# Open Neovim - lazy.nvim will install plugins, Mason will install LSPs
```

**Note**: To find your GPG signing key ID, run `gpg --list-secret-keys --keyid-format=long` and look for the key you want to use for signing commits.

**Security Note**: API keys and secrets are stored in `~/.config/fish/conf.d/secrets.fish` which is excluded from version control via `.chezmoiignore`. You'll need to create this file manually on each machine.

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

- **hypr** and **DankMaterialShell** configs are opt-in: they are only applied when `hypr = true` is set under `[data]` in `~/.config/chezmoi/chezmoi.toml`. Files under `hypr/dms/` that DMS regenerates are not tracked; only `binds.lua` is.
- **aerospace** and **sketchybar** configs are automatically excluded on non-macOS systems via `.chezmoiignore`
- All paths use `$HOME` for cross-platform compatibility
