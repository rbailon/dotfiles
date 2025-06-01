#!/bin/bash
#  UPDATES

script_name=$(basename "$0")

# Count the instances
instance_count=$(ps aux | grep -F "$script_name" | grep -v grep | grep -v $$ | wc -l)

if [ $instance_count -gt 1 ]; then
    sleep $instance_count
fi

# ----------------------------------------------------- 
# Indicador de colores
# ----------------------------------------------------- 
level_green=0
level_yellow=25
level_red=100

# ----------------------------------------------------- 
# Contar updates
# ----------------------------------------------------- 
check_lock_files() {
    local pacman_lock="/var/lib/pacman/db.lck"
    local checkup_lock="${TMPDIR:-/tmp}/checkup-db-${UID}/db.lck"

    while [ -f "$pacman_lock" ] || [ -f "$checkup_lock" ]; do
        sleep 1
    done
}

check_lock_files

num_updates=$(checkupdates-with-aur | wc -l)

# ----------------------------------------------------- 
# Salida en JSON
# ----------------------------------------------------- 
css_class="green"

if [ "$num_updates" -gt $level_yellow ]; then
    css_class="yellow"
fi

if [ "$num_updates" -gt $level_red ]; then
    css_class="red"
fi

if [ "$num_updates" -gt $level_green ]; then
    printf '{"text": "%s", "alt": "%s", "tooltip": "Click para actualizar el sistema", "class": "%s"}' "$num_updates" "$num_updates" "$css_class"
else
    printf '{"text": "0", "alt": "0", "tooltip": "No updates available", "class": "green"}'
fi
