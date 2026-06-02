# shell functions

# Auto-inserts closing quotes and brackets in the terminal
_autopair_single_quote() { LBUFFER+="'"; RBUFFER="'${RBUFFER}"; }
_autopair_double_quote() { LBUFFER+='"'; RBUFFER='"'"${RBUFFER}"; }
_autopair_backtick()     { LBUFFER+='`'; RBUFFER='`'"${RBUFFER}"; }
_autopair_parentheses()  { LBUFFER+='('; RBUFFER=')'"${RBUFFER}"; }
_autopair_braces()       { LBUFFER+='{'; RBUFFER='}'${RBUFFER}; }

zle -N _autopair_single_quote
zle -N _autopair_double_quote
zle -N _autopair_backtick
zle -N _autopair_parentheses
zle -N _autopair_braces

bindkey "'" _autopair_single_quote
bindkey '"' _autopair_double_quote
bindkey '`' _autopair_backtick
bindkey '(' _autopair_parentheses
bindkey '{' _autopair_braces

# Grabs the currently playing song via yt-dlp and sends it over Bluetooth
keeper() {
  local title=$(nowplaying-cli get title 2>/dev/null)
  local artist=$(nowplaying-cli get artist 2>/dev/null)

  if [[ -z "$title" || "$title" == "null" ]]; then
    echo "Nothing playing"
    return 1
  fi

  local query="${artist:+$artist - }$title"
  echo "Keeping: $query"

  local outpath
  outpath=$(yt-dlp "ytsearch1:$query" \
    -x --audio-format mp3 \
    -o "$HOME/Downloads/%(title)s.%(ext)s" \
    --print after_move:filepath 2>/dev/null)

  [[ -z "$outpath" ]] && { echo "yt-dlp failed"; return 1; }

  echo "Sending: $outpath"
  open -a "Bluetooth File Exchange" "$outpath"
}

# Generates a blank Markdown table of specified dimensions (e.g., mdtable 3x4)
mdtable() {
  if [[ -z "$1" ]]; then
    echo "Usage: mdtable <cols>x<rows>"
    return 1
  fi
  
  local cols=$(echo "$1" | cut -dx -f1)
  local rows=$(echo "$1" | cut -dx -f2)
  local header=$(for i in $(seq 1 $cols); do printf "| col$i "; done; echo "|")
  local divider=$(for i in $(seq 1 $cols); do printf "|------"; done; echo "|")
  local row=$(for i in $(seq 1 $cols); do printf "|       "; done; echo "|")
  
  echo "$header"
  echo "$divider"
  for r in $(seq 1 $rows); do
    echo "$row"
  done
}

# Strips accidental leading '$' from copied/pasted commands before execution
if [ -n "$ZSH_VERSION" ]; then
  _no_dollar_preexec() {
    : 
  }

  _no_dollar_accept_line() {
    local stripped="${BUFFER#"${BUFFER%%[! ]*}"}" 
    if [[ "$stripped" == \$* ]]; then
      BUFFER="${stripped:1}" 
    fi
    zle .accept-line
  }

  zle -N accept-line _no_dollar_accept_line

elif [ -n "$BASH_VERSION" ]; then
  _no_dollar_run() {
    local cmd
    cmd="$(history 1 | sed 's/^[[:space:]]*[0-9]*[[:space:]]*//')"
    local stripped="${cmd#"${cmd%%[! ]*}"}"
    if [[ "$stripped" == \$* ]]; then
      local clean="${stripped:1}"
      history -s "$clean"
      eval "$clean"
    fi
  }

  command_not_found_handle() {
    if [[ "$1" == '$' ]] && [[ $# -gt 1 ]]; then
      shift
      "$@"
      return $?
    fi
    echo "bash: $1: command not found" >&2
    return 127
  }
fi

# Creates a quick timestamped text file in the ~/personal/NOTES directory
note() {
  local dir="$HOME/personal/NOTES"
  mkdir -p "$dir"
  local file="$dir/$(date '+%I-%M%p_%Y-%m-%d').txt"
  echo "$*" > "$file"
  echo "saved: $file"
}

# Closes the current iTerm pane, or quits the entire app if it's the last pane open
q() {
  local panes=$(osascript -e 'tell application "iTerm2"
    set n to 0
    repeat with w in windows
      repeat with t in tabs of w
        set n to n + (count of sessions of t)
      end repeat
    end repeat
    return n
  end tell' 2>/dev/null)
  
  if [[ "$panes" -le 1 ]]; then
    osascript -e 'tell application "iTerm2" to quit'
  else
    exit
  fi
}

# Opens yazi file manager and automatically changes the shell to the last viewed directory on exit
f() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  command yazi "$@" --cwd-file="$tmp"
  IFS= read -r -d '' cwd < "$tmp"
  [ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
  rm -f -- "$tmp"
}
