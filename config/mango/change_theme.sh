#!/usr/bin/env bash
set -euo pipefail

WALLPAPER_DIR="$HOME/Pictures/wallpapers"

if [[ -n "${1:-}" && -f "${1:-}" ]]; then
    WALLPAPER="$1"
else
    WALLPAPER="$(find "$WALLPAPER_DIR" -type f \( \
        -iname "*.jpg" -o \
        -iname "*.jpeg" -o \
        -iname "*.png" -o \
        -iname "*.webp" \
    \) | shuf -n 1)"
fi

[[ -f "$WALLPAPER" ]] || {
    echo "[ERROR] No wallpaper found."
    exit 1
}

if ! pgrep -x awww-daemon >/dev/null; then
    awww-daemon >/dev/null 2>&1 &
    sleep 0.5
fi

awww img "$WALLPAPER" \
    --transition-type outer \
    --transition-pos "0.85,0.85" \
    --transition-step 90 \
    --transition-fps 144

matugen image "$WALLPAPER" --source-color-index 0 || true

sleep 1

ln -sf "$WALLPAPER" /tmp/current_wallpaper

if pgrep -x kitty >/dev/null; then
    pkill -USR1 kitty
fi

if pgrep -x swaync >/dev/null; then
    swaync-client --reload-css >/dev/null 2>&1 || {
        pkill swaync
        nohup swaync >/dev/null 2>&1 &
    }
fi

"$HOME/.config/waybar/launch.sh"

if command -v mmsg >/dev/null; then
    mmsg -d reload_config >/dev/null 2>&1
fi

echo "[SUCCESS] Theme synchronized: $(basename "$WALLPAPER")"