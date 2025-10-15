if status is-interactive
    # Enable vim keybindings
    fish_vi_key_bindings

    # Auto-launch tmux if not already in tmux
    if not set -q TMUX
        exec tmux
    end
end
