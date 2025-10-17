if status is-interactive
    # Enable vim keybindings
    fish_vi_key_bindings

    # Auto-launch tmux if not already in tmux
    if not set -q TMUX
        exec tmux
    end
end

alias claude="$HOME/.claude/local/claude"
set -gx PATH $HOME/.local/bin $PATH
starship init fish | source
