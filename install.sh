#!/usr/bin/env bash
set -euo pipefail

REPO_URL="https://github.com/PlayfulMathematician/configuration.git"
BASE="$HOME/stuff_bin/configuration"
REPO="$BASE"
CONFIG="$HOME/.config"
BACKUP="$HOME/.config-backup/$(date +%s)"

mkdir -p "$BASE" "$CONFIG" "$BACKUP"

if [ -d "$REPO/.git" ]; then
  git -C "$REPO" pull --rebase
else
  git clone "$REPO_URL" "$REPO"
fi

move_if_exists() {
  local dest="$1"
  if [ -e "$dest" ] || [ -L "$dest" ]; then
    mv "$dest" "$BACKUP/"
  fi
}

link() {
  local src="$1"
  local dest="$2"
  move_if_exists "$dest"
  ln -s "$src" "$dest"
}

link "$REPO/fish"           "$CONFIG/fish"
link "$REPO/hyprland"       "$CONFIG/hypr"
link "$REPO/kitty"          "$CONFIG/kitty"
link "$REPO/neovim"         "$CONFIG/nvim"
link "$REPO/waybar"         "$CONFIG/waybar"
link "$REPO/starship.toml"  "$CONFIG/starship.toml"
link "$REPO/emacs"          "$HOME/.emacs.d"

