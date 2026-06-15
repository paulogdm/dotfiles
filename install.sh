#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BREWFILE="$DOTFILES/brew/Brewfile"

info() {
  echo "  $*"
}

have() {
  command -v "$1" &>/dev/null
}

load_homebrew() {
  local brew_bin=""

  if have brew; then
    brew_bin="$(command -v brew)"
  elif [[ -x /opt/homebrew/bin/brew ]]; then
    brew_bin="/opt/homebrew/bin/brew"
  elif [[ -x /usr/local/bin/brew ]]; then
    brew_bin="/usr/local/bin/brew"
  fi

  if [[ -n "$brew_bin" ]]; then
    eval "$("$brew_bin" shellenv)"
  fi
}

install_homebrew() {
  if have brew; then
    return
  fi

  info "installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  load_homebrew

  if ! have brew; then
    echo "Homebrew installed, but brew is not available in this shell." >&2
    echo "Open a new terminal and rerun this script." >&2
    exit 1
  fi
}

link() {
  local src="$1" dst="$2"
  mkdir -p "$(dirname "$dst")"
  ln -sf "$src" "$dst"
  info "linked $dst"
}

restore_fish_plugins() {
  echo "==> Fish Plugins"
  if ! have fish; then
    echo "fish was not installed by Homebrew; cannot restore plugins." >&2
    exit 1
  fi

  fish -c '
    if not functions -q fisher
      echo "fisher is not available; check the Brewfile install." >&2
      exit 1
    end

    fisher update
  '
}

install_node_tools() {
  echo "==> Node.js tools"
  if have fnm; then
    eval "$(fnm env --shell bash)"
  fi

  export PNPM_HOME="${PNPM_HOME:-$HOME/Library/pnpm}"
  export PATH="$PNPM_HOME/bin:$PNPM_HOME:$PATH"
  mkdir -p "$PNPM_HOME/bin"

  if ! have pnpm; then
    echo "pnpm was not installed by Homebrew; cannot install global Node.js tools." >&2
    exit 1
  fi

  pnpm install -g vercel @anthropic-ai/claude-code
}

install_opencode() {
  echo "==> opencode CLI"
  if have opencode || [[ -x "$HOME/.opencode/bin/opencode" ]]; then
    info "opencode CLI already installed"
    return
  fi

  curl -fsSL https://opencode.ai/install | sh
}

echo "==> Homebrew"
load_homebrew
install_homebrew
brew bundle install --file="$BREWFILE"

echo "==> Fish Shell"
link "$DOTFILES/fish/config.fish"   "$HOME/.config/fish/config.fish"
link "$DOTFILES/fish/fish_plugins"  "$HOME/.config/fish/fish_plugins"
link "$DOTFILES/fish/conf.d/fnm.fish"    "$HOME/.config/fish/conf.d/fnm.fish"
link "$DOTFILES/fish/conf.d/uv.env.fish" "$HOME/.config/fish/conf.d/uv.env.fish"
restore_fish_plugins

echo "==> Git"
link "$DOTFILES/git/gitconfig" "$HOME/.gitconfig"

echo "==> iTerm2"
defaults write com.googlecode.iterm2 PrefsCustomFolder -string "$DOTFILES/iterm2"
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true
info "iTerm2 will load prefs from $DOTFILES/iterm2"
info "(restart iTerm2 to apply)"

echo "==> Zed"
link "$DOTFILES/zed/settings.json" "$HOME/.config/zed/settings.json"
info "Zed will auto-install extensions listed in $DOTFILES/zed/settings.json on startup"

install_node_tools
install_opencode

echo ""
echo "Done. Restart your shell to apply changes."
