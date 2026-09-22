#!/usr/bin/env bash
# Claude Code statusline: which account profile the session is running under,
# plus cwd and model. Profile comes from CLAUDE_CONFIG_DIR (see the fish
# functions claude/wclaude/pclaude); the account is read back from that dir to
# confirm the session is actually logged in.
input=$(cat)

cfg="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"
case "$cfg" in
  "$HOME/.claude-work") label="work"      ; color=$'\033[38;2;255;158;100m' ;;  # orange
  "$HOME/.claude")      label="personal"  ; color=$'\033[38;2;158;206;106m' ;;  # green
  *)                    label="$(basename "$cfg")"; color=$'\033[38;2;187;154;247m' ;;  # magenta
esac

read -r authed model dir <<<"$(
  CFG="$cfg" python3 -c '
import json, os, sys
data = json.load(sys.stdin)
try:
    with open(os.path.join(os.environ["CFG"], ".claude.json")) as f:
        authed = "yes" if json.load(f).get("oauthAccount", {}).get("emailAddress") else "no"
except Exception:
    authed = "no"
model = (data.get("model") or {}).get("display_name") or "-"
d = (data.get("workspace") or {}).get("current_dir") or os.getcwd()
home = os.path.expanduser("~")
if d == home:
    d = "~"
elif d.startswith(home + os.sep):
    d = "~" + d[len(home):]
print(authed, model.replace(" ", " "), d.replace(" ", " "))
' <<<"$input"
)"

if [ "$authed" != yes ]; then
  label="$label (logged out)"
  color=$'\033[38;2;247;118;142m'  # red
fi

dim=$'\033[38;2;86;95;137m'
blue=$'\033[38;2;122;162;247m'
reset=$'\033[0m'

printf '%s\n' "${color}⬢ ${label}${reset} ${dim}·${reset} ${blue}${dir//$' '/ }${reset} ${dim}·${reset} ${dim}${model//$' '/ }${reset}"
