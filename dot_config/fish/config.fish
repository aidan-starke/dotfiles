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
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
