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
  [ -e "$1" ] || [ -L "$1" ] && mv "$1" "$BACKUP/"
}

link() {
  move_if_exists "$2"
  ln -s "$1" "$2"
}

link "$REPO/fish"      "$CONFIG/fish"
link "$REPO/hyprland"  "$CONFIG/hypr"
link "$REPO/kitty"     "$CONFIG/kitty"
link "$REPO/neovim"    "$CONFIG/nvim"
link "$REPO/waybar"    "$CONFIG/waybar"
link "$REPO/starship.toml" "$CONFIG/starship.toml"

