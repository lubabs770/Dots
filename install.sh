#!/usr/bin/env bash
#
# Dots installer
#
#   curl -fsSL https://raw.githubusercontent.com/lubabs770/Dots/main/install.sh | bash
#
# Copies the dotfiles from this repo into $HOME, backing up anything it would
# overwrite, then optionally installs Homebrew packages and VS Code extensions.
#
set -euo pipefail

REPO_URL="https://github.com/lubabs770/Dots.git"
BACKUP_DIR="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"
CLONE=""

# ── pretty output ───────────────────────────────────────────────────────────
info()  { printf '\033[1;34m==>\033[0m %s\n' "$*"; }
ok()    { printf '\033[1;32m  ✓\033[0m %s\n' "$*"; }
warn()  { printf '\033[1;33m  ⚠\033[0m %s\n' "$*"; }
err()   { printf '\033[1;31m  ✗\033[0m %s\n' "$*" >&2; }

cleanup() { [ -n "$CLONE" ] && [ -d "$CLONE" ] && rm -rf "$CLONE"; }
trap cleanup EXIT

# Files in the repo whose committed content is a <redacted> placeholder or
# machine-specific secret. They are still installed (per design) but flagged.
REDACTED=(
  ".claude.json"
  ".config/finicky/finicky.js"
  ".config/gh/hosts.yml"
  ".config/linear/credentials.toml"
  ".config/iterm2/AppSupport/EnableAI.secureSetting"
  ".config/.mono/keypairs/[1][2be1b3a0-4467-4ed2-ab1e-e8c4bfd65170][-1].xml"
)

# Top-level repo entries that get special handling instead of a $HOME mirror.
is_special() {
  case "$1" in
    install.sh|README.md|.gitignore|Brewfile) return 0 ;;
    com.googlecode.iterm2.plist)              return 0 ;;  # → ~/Library/Preferences
    vscode|vscode/*)                          return 0 ;;  # → VS Code User dir
    .git|.git/*)                              return 0 ;;
    *) return 1 ;;
  esac
}

is_redacted() {
  local f="$1" r
  for r in "${REDACTED[@]}"; do [ "$f" = "$r" ] && return 0; done
  return 1
}

# Back up dest if it exists, then copy src → dest.
place() {
  local src="$1" dest="$2"
  if [ -e "$dest" ] || [ -L "$dest" ]; then
    local rel="${dest#"$HOME"/}"
    mkdir -p "$BACKUP_DIR/$(dirname "$rel")"
    mv "$dest" "$BACKUP_DIR/$rel"
  fi
  mkdir -p "$(dirname "$dest")"
  cp -R "$src" "$dest"
}

# ── 1. preflight ──────────────────────────────────────────────────────────--
info "Preflight"
[ "$(uname -s)" = "Darwin" ] || warn "This is built for macOS; continuing anyway."

if ! command -v git >/dev/null 2>&1; then
  err "git not found. Install the Xcode Command Line Tools first:"
  err "    xcode-select --install"
  exit 1
fi
ok "git present"

if ! command -v brew >/dev/null 2>&1; then
  info "Homebrew not found — installing"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  # Make brew available in this shell (Apple Silicon vs Intel paths).
  if [ -x /opt/homebrew/bin/brew ]; then eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [ -x /usr/local/bin/brew ]; then eval "$(/usr/local/bin/brew shellenv)"; fi
fi
command -v brew >/dev/null 2>&1 && ok "Homebrew present"

# ── 2. fetch repo ─────────────────────────────────────────────────────────--
info "Cloning $REPO_URL"
CLONE="$(mktemp -d)"
git clone --depth 1 "$REPO_URL" "$CLONE" >/dev/null 2>&1
ok "Cloned to $CLONE"

# ── 3. mirror dotfiles into $HOME ───────────────────────────────────────────-
info "Installing dotfiles (backups → $BACKUP_DIR)"
placed=0
while IFS= read -r -d '' file; do
  rel="${file#"$CLONE"/}"
  is_special "$rel" && continue
  place "$file" "$HOME/$rel"
  placed=$((placed + 1))
  is_redacted "$rel" && warn "placed REDACTED placeholder: ~/$rel (fix manually)"
done < <(find "$CLONE" -type f -not -path "$CLONE/.git/*" -print0)
ok "Placed $placed files"

# ── 4. special cases ────────────────────────────────────────────────────────
if [ -f "$CLONE/com.googlecode.iterm2.plist" ]; then
  place "$CLONE/com.googlecode.iterm2.plist" "$HOME/Library/Preferences/com.googlecode.iterm2.plist"
  ok "iTerm2 preferences → ~/Library/Preferences/"
fi

VSCODE_USER="$HOME/Library/Application Support/Code/User"
if [ -d "$CLONE/vscode" ]; then
  for f in settings.json keybindings.json; do
    [ -f "$CLONE/vscode/$f" ] && place "$CLONE/vscode/$f" "$VSCODE_USER/$f"
  done
  ok "VS Code settings → $VSCODE_USER"
  if command -v code >/dev/null 2>&1 && [ -f "$CLONE/vscode/extensions.txt" ]; then
    info "Installing VS Code extensions"
    while IFS= read -r ext; do
      [ -z "$ext" ] && continue
      code --install-extension "$ext" --force >/dev/null 2>&1 \
        && ok "ext $ext" || warn "ext $ext failed"
    done < "$CLONE/vscode/extensions.txt"
  else
    warn "'code' not on PATH — skipping VS Code extensions"
  fi
fi

# ── 5. Homebrew bundle ──────────────────────────────────────────────────────
if command -v brew >/dev/null 2>&1 && [ -f "$CLONE/Brewfile" ]; then
  info "Running brew bundle (this can take a while)"
  brew bundle --file="$CLONE/Brewfile" || warn "brew bundle reported errors"
else
  warn "Skipping brew bundle (brew or Brewfile missing)"
fi

# ── 6. report empty submodule dirs ──────────────────────────────────────────
SUBMODULES=(
  ".config/yazi/flavors/everforest-medium.yazi"
  ".config/yazi/flavors/gruvbox-dark.yazi"
  ".config/yazi/flavors/kanagawa.yazi"
  ".config/yazi/flavors/nord.yazi"
  ".config/yazi/flavors/tokyo-night.yazi"
  ".zsh/themes/aphrodite"
)
empties=()
for s in "${SUBMODULES[@]}"; do
  [ -f "$CLONE/$s" ] || empties+=("$s")
done
if [ "${#empties[@]}" -gt 0 ]; then
  warn "These were stored as empty submodule refs and were NOT restored:"
  for s in "${empties[@]}"; do printf '      %s\n' "$s"; done
fi

info "Done."
[ -d "$BACKUP_DIR" ] && info "Replaced files backed up to: $BACKUP_DIR"
info "Restart your shell (or: exec zsh) to pick up the new config."
