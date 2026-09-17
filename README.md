# Dotfiles

Personal dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## Contents

- **fish** - Fish shell configuration with vim keybindings
- **herdr** - Terminal multiplexer config with Tokyo Night theme
- **neovim** - lives in its own repo: [aidan-starke/LazyNvim](https://github.com/aidan-starke/LazyNvim) (clone to `~/.config/nvim`)
- **git** - Git aliases and settings
- **starship** - Cross-shell prompt
- **hypr** - Hyprland compositor config (Linux only, opt-in)
- **DankMaterialShell** - DMS settings and Tokyo Night theme (Linux only, opt-in with hypr)
- **aerospace** - Window manager config (macOS only)
- **sketchybar** - Status bar config (macOS only)

## Dependencies

Install these before running `chezmoi apply`. Everything here is referenced directly by a config in this repo.

### All platforms

| Tool | Why |
|---|---|
| [chezmoi](https://www.chezmoi.io/) | applies the dotfiles |
| git + gpg | `git/config` signs commits with the key in `[data.git] signingkey` |
| [fish](https://fishshell.com/) | shell; `config.fish` runs on every login |
| [starship](https://starship.rs/) | prompt, initialised by `config.fish` |
| [herdr](https://herdr.dev/) at `~/.local/bin/herdr` | terminal multiplexer, launched manually with `herdr` |
| [neovim](https://neovim.io/) | the `nv` fish function wraps it; config is a separate repo, see below |
| [asdf](https://asdf-vm.com/) (Linux) | `conf.d/asdf.fish` adds `~/.asdf/shims` to `PATH`; plugins in use are `nodejs`, `golang`, `bun` |
| [bun](https://bun.sh/) | `config.fish` adds `~/.bun/bin` to `PATH` |
| go | `config.fish` adds `~/go/bin` to `PATH` |

### Linux (opt-in, `hypr = true`)

Only needed on machines that set `hypr = true` in `~/.config/chezmoi/chezmoi.toml`.

| Package (Arch) | Why |
|---|---|
| `hyprland` (0.56+, Lua config support) | `hyprland.lua` and friends are Lua, not `.conf` |
| `dms-shell-hyprland` | DankMaterialShell bar/launcher/lock; `dms/binds.lua` calls `dms ipc` for volume, brightness, screenshots, lock, etc. |
| `kitty` | `$TERMINAL` and the `SUPER+RETURN` bind |
| `dolphin` | `SUPER+D` file manager bind; `fix-dolphin-mime.sh` runs at startup |
| `zen-browser` (AUR) | `SUPER+SHIFT+B` |
| `lazydocker` | `SUPER+SHIFT+D` |
| `network-manager-applet`, `blueman` | `nm-applet` and `blueman-applet` autostart |
| `wf-recorder` | screen recording stop bind |

```bash
sudo pacman -S hyprland dms-shell-hyprland kitty dolphin lazydocker network-manager-applet blueman wf-recorder
paru -S zen-browser-bin
```

### macOS

`install-macos.sh` installs these via Homebrew:

| Tool | Why |
|---|---|
| `aerospace` (cask) | tiling window manager, `aerospace.toml` |
| `sketchybar`, `sf-symbols` (cask), `jq` | status bar; the plugin scripts shell out to `jq` |
| `alacritty` | terminal config in `alacritty/` |
| `ripgrep`, `fd`, `tree-sitter` | Neovim telescope/treesitter |
| `git-delta`, `lazygit`, `fzf` | optional CLI niceties |

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

# Neovim config (separate repo, not managed by chezmoi)
git clone git@github.com:aidan-starke/LazyNvim.git ~/.config/nvim

# Install herdr to ~/.local/bin/herdr and run `herdr` to start a session
# Open Neovim - lazy.nvim will install plugins, Mason will install LSPs (needs ripgrep, fd, a C compiler for tree-sitter)
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
