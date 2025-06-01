#!/bin/bash

# Espera breve para que Hyprland registre bien los cambios
sleep 1

# Monitores — AJUSTA estos nombres según tu salida de `hyprctl monitors`
MONITOR_PORTATIL="eDP-1"
MONITOR_DOCK_1="DP-3"
MONITOR_DOCK_2="DP-4"

# Comprueba si el monitor del dock está presente
if hyprctl monitors | grep -q "$MONITOR_DOCK_1"; then
    # Modo dock: apaga pantalla del portátil, activa monitores externos
    hyprctl keyword monitor "$MONITOR_PORTATIL,disable"
    hyprctl keyword monitor "$MONITOR_DOCK_1,1920x1080@59,1920x0,1"
		hyprctl dispatch setprop margin '"0 30 0 0"' monitor:$MONITOR_DOCK_1
    hyprctl keyword monitor "$MONITOR_DOCK_2,1920x1080@60,0x0,1"
else
    # Solo portátil
    hyprctl keyword monitor "$MONITOR_PORTATIL,1920x1080@60,0x0,1"
    hyprctl keyword monitor "$MONITOR_DOCK_1,disable"
    hyprctl keyword monitor "$MONITOR_DOCK_2,disable"
fi

