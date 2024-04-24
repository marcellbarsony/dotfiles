#!/usr/bin/env bash

# monitors=/tmp/hypr/monitors_temp
# hyprctl monitors > $monitors
#
# if [[ -z $1 ]]; then
#   workspace=$(grep -B 5 "focused: no" "$monitors" | awk 'NR==1 {print $3}')
# else
#   workspace=$1
# fi
#
#
# activemonitor=$(grep -B 11 "focused: yes" "$monitors" | awk 'NR==1 {print $2}')
# passivemonitor=$(grep  -B 7 "($workspace)" "$monitors" | awk 'NR==1 {print $2}')
# #activews=$(grep -A 2 "$activemonitor" "$monitors" | awk 'NR==3 {print $1}' RS='(' FS=')')
# passivews=$(grep -A 4 "$passivemonitor" "$monitors" | awk 'NR==4 {print $1}' RS='(' FS=')')
#
# if [[ $workspace -eq $passivews ]] && [[ $activemonitor != "$passivemonitor" ]]; then
#   hyprctl dispatch swapactiveworkspaces "$activemonitor" "$passivemonitor"
#   echo $activemonitor $passivemonitor
# else
#   hyprctl dispatch moveworkspacetomonitor "$workspace $activemonitor" && hyprctl dispatch workspace "$workspace"
# fi
#
# exit 0





# SPDX-License-Identifier: CC0-1.0
set -euo pipefail

get_number_of_monitors() {
    jq -r '.|length'
}

get_active_monitor() {
    jq -r '[.[]|select(.focused == true)][0].id'
}

get_passive_monitor_with_workspace() {
    local workspace="$1"
    jq -r '[.[]|select(.focused == false and .activeWorkspace.id == '"$workspace"')][0].id'
}

switch_to_workspace() {
    local workspace="$1"
    if [[ $# -eq 2 ]]; then
        local activemonitor="$2"
        hyprctl dispatch moveworkspacetomonitor "$workspace $activemonitor"
    fi
    hyprctl dispatch workspace "$workspace"
}

swap_active_workspaces() {
    local activemonitor="$1"
    local passivemonitor="$2"
    hyprctl dispatch swapactiveworkspaces "$activemonitor" "$passivemonitor"
}

main() {
    if [[ $# -ne 1 ]]; then
        echo "Usage: $0 <workspace>" >&2
        exit 1
    fi
    local workspace=$1
    local monitors="$(hyprctl -j monitors)"

    if [[ $(echo "$monitors" | get_number_of_monitors) -eq 1 ]]; then
        switch_to_workspace "$workspace"
    fi

    local activemonitor="$(echo "$monitors" | get_active_monitor)"
    local passivemonitor="$(echo "$monitors" | get_passive_monitor_with_workspace "$workspace")"

    if [[ "$passivemonitor" == "null" ]]; then
        switch_to_workspace "$workspace" "$activemonitor"
    else
        swap_active_workspaces "$activemonitor" "$passivemonitor"
    fi
}

main "$@"
