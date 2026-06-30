#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# ── Homebrew ──────────────────────────────────────────────────────────────────
if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Installing Homebrew packages..."
brew bundle --file="$DOTFILES/Brewfile"

# ── pipx packages ─────────────────────────────────────────────────────────────
if command -v pipx &>/dev/null && [ -f "$DOTFILES/pipx-packages.txt" ]; then
  echo "Installing pipx packages..."
  xargs -I{} sh -c 'pipx install $(echo {} | cut -d" " -f1)' < "$DOTFILES/pipx-packages.txt"
fi

# ── Symlinks ──────────────────────────────────────────────────────────────────
echo "Creating symlinks..."
stow --dir="$DOTFILES" --target="$HOME" .

# ── iTerm2 ────────────────────────────────────────────────────────────────────
echo "Configuring iTerm2 preferences..."
defaults write com.googlecode.iterm2 PrefsCustomFolder -string "$DOTFILES/Library/Preferences"
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true
defaults write com.googlecode.iterm2 NoSyncNeverRemindPrefsChangesLostForFile -bool true

echo "Done."
