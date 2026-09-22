function __claude_run --description 'Launch Claude Code under a named account profile'
    set -l profile $argv[1]
    set -l rest $argv[2..-1]

    set -l state $HOME/.local/state/claude
    mkdir -p $state

    switch $profile
        case personal
            set -gx CLAUDE_CONFIG_DIR $HOME/.claude
        case work
            set -gx CLAUDE_CONFIG_DIR $HOME/.claude-work
        case last
            # Inside an existing Claude session, inherit that session's profile.
            if not set -q CLAUDE_CONFIG_DIR
                set -l remembered work
                if test -r $state/last-profile
                    set remembered (string trim (cat $state/last-profile))
                end
                if test "$remembered" = personal
                    set -gx CLAUDE_CONFIG_DIR $HOME/.claude
                else
                    set -gx CLAUDE_CONFIG_DIR $HOME/.claude-work
                end
            end
    end

    # Remember for the next bare `claude`
    if test "$CLAUDE_CONFIG_DIR" = "$HOME/.claude"
        echo personal >$state/last-profile
    else
        echo work >$state/last-profile
    end

    $HOME/.local/bin/claude $rest
end
