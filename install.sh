#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

link() {
  local src="$1" dst="$2"
  mkdir -p "$(dirname "$dst")"
  ln -sf "$src" "$dst"
  echo "  linked $dst"
}

echo "==> Homebrew"
if ! command -v brew &>/dev/null; then
  echo "  installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
brew bundle install --file="$DOTFILES/brew/Brewfile"

echo "==> Fish Shell"
link "$DOTFILES/fish/config.fish"   "$HOME/.config/fish/config.fish"
link "$DOTFILES/fish/fish_plugins"  "$HOME/.config/fish/fish_plugins"
link "$DOTFILES/fish/conf.d/fnm.fish"    "$HOME/.config/fish/conf.d/fnm.fish"
link "$DOTFILES/fish/conf.d/uv.env.fish" "$HOME/.config/fish/conf.d/uv.env.fish"

if command -v fish &>/dev/null && command -v fisher &>/dev/null; then
  echo "  running fisher update..."
  fish -c "fisher update"
fi

echo "==> Git"
link "$DOTFILES/git/gitconfig" "$HOME/.gitconfig"

echo ""
echo "Done. Restart your shell to apply changes."
