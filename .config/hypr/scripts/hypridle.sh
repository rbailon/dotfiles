#!/bin/bash
# -------------------------------------------------------------
# Scripts HYPRIDLE
# -------------------------------------------------------------

SERVICE="hypridle"
if [[ "$1" == "status" ]]; then
    sleep 1
    if pgrep -x "$SERVICE" >/dev/null; then
        echo '{"text": "EXECUTANDO", "class": "active", "tooltip": "Vigilancia de pantalla activa\nLeft: Deactivate"}'
    else
        echo '{"text": "PARADO", "class": "notactive", "tooltip": "Vigilancia de pantalla inactiva\nLeft: Activate"}'
    fi
fi
if [[ "$1" == "toggle" ]]; then
    pgrep -x "$SERVICE" >/dev/null && killall hypridle || hypridle
fi
