#!/bin/bash

set -e

echo "Installing packages for macOS dotfiles setup..."

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew already installed"
fi

# Update Homebrew
echo "Updating Homebrew..."
brew update

# Core shell and terminal tools
echo "Installing core shell and terminal tools..."
brew install fish
brew install starship
brew install --cask alacritty

# Version managers
echo "Installing version managers..."
brew install asdf  # version manager (nodejs, golang, bun plugins)

# Editor
echo "Installing Neovim..."
brew install neovim

# Window management and status bar (macOS only)
echo "Installing window manager and status bar..."
brew install --cask nikitabobko/tap/aerospace
brew install sketchybar
brew install jq  # used by sketchybar plugin scripts
brew install --cask sf-symbols  # For sketchybar icons

# Git
echo "Installing Git..."
brew install git

# Neovim dependencies
echo "Installing Neovim dependencies..."

# Core dependencies for telescope, treesitter, etc.
brew install ripgrep  # Required for telescope grep
brew install fd  # Required for telescope file finding
brew install tree-sitter  # Syntax highlighting

# Install Node.js via fnm (required by Mason for many LSPs)
echo "Installing Node.js via fnm..."
fnm install --lts
fnm use lts-latest

# Note: Language servers will be installed by Mason in Neovim
# Just ensure Mason's dependencies are available
echo "Note: Language servers will be installed automatically by Mason in Neovim"

# Optional but recommended
echo "Installing recommended tools..."
brew install git-delta  # Better git diffs
brew install lazygit  # Git TUI
brew install fzf  # Fuzzy finder

# Install Oh My Fish (optional but recommended for fish plugins)
echo "Installing Oh My Fish..."
if [ ! -d "$HOME/.local/share/omf" ]; then
    curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
else
    echo "Oh My Fish already installed"
fi

# Set fish as default shell
if [ "$SHELL" != "$(which fish)" ]; then
    echo "Setting fish as default shell..."
    echo "$(which fish)" | sudo tee -a /etc/shells
    chsh -s "$(which fish)"
    echo "Shell changed to fish. Please log out and log back in for changes to take effect."
else
    echo "Fish is already the default shell"
fi

echo ""
echo "Installation complete!"
echo ""
echo "Next steps:"
echo "1. Install chezmoi: brew install chezmoi"
echo "2. Initialize dotfiles: chezmoi init https://github.com/aidan-starke/dotfiles.git"
echo "3. Preview changes: chezmoi diff"
echo "4. Apply dotfiles: chezmoi apply"
echo "5. Install herdr to ~/.local/bin (fish auto-launches it)"
echo "6. Clone Neovim config: git clone git@github.com:aidan-starke/LazyNvim.git ~/.config/nvim"
echo "7. Open Neovim - lazy.nvim will install plugins, Mason will install LSPs"
echo "8. Start Aerospace (it will auto-start on next login)"
echo "9. Configure Sketchybar: brew services start sketchybar"
