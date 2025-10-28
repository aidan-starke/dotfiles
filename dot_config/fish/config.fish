# Disable welcome message
set -g fish_greeting

if status is-interactive
    # Enable vim keybindings
    fish_vi_key_bindings

    # Auto-launch tmux if not already in tmux
    if not set -q TMUX
        exec tmux
    end
end

set -gx PATH $HOME/.local/bin $PATH

# starship
starship init fish | source

# bun
set --export BUN_INSTALL "$HOME/.bun/bin"
set --export PATH $BUN_INSTALL $PATH

# go
set --export PATH /usr/bin/go $PATH
set --export PATH $HOME/go/bin $PATH

# claude migrated
alias claude="/home/aidan/.claude/local/claude"
