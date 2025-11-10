# Disable welcome message
set -g fish_greeting

if status is-interactive
    # Enable vim keybindings
    fish_vi_key_bindings

    # Auto-launch tmux if not already in tmux
    # if not set -q TMUX
    #     exec tmux
    # end
end

set -gx PATH $HOME/.local/bin $PATH

# starship
starship init fish | source

# go
set --export PATH /usr/bin/go $PATH
set --export PATH $HOME/go/bin $PATH

# claude migrated
alias claude="$HOME/.claude/local/claude"

# bun
set --export BUN_INSTALL "$HOME/.bun/bin"
set --export PATH $BUN_INSTALL/bin $PATH

# pip3
set -gx PATH /Users/aidan/Library/Python/3.9/bin $PATH
