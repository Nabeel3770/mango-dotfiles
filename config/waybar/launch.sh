#!/usr/bin/env bash
pkill -x waybar 2>/dev/null || true
sleep 0.2
cd ~/.config/waybar
waybar -c config.jsonc -s style.css &
sleep 0.2
waybar -c dock-config.jsonc -s style.css &