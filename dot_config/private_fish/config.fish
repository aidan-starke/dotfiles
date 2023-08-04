if status is-interactive
	 fish_vi_key_bindings
end

if not set -q TMUX
    exec tmux
end

# Cargo
set PATH $PATH $HOME/.cargo/bin

# CMake
set PATH "/Applications/CMake.app/Contents/bin":"$PATH"

export PATH="$PATH:/Users/aidan.starke/.foundry/bin"

export PATH="$PATH:/Users/aidan.starke/.foundry/bin"
