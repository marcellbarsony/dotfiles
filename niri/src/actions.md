Usage: niri msg action <ACTION>

Actions:
  quit
          Exit niri
  power-off-monitors
          Power off all monitors via DPMS
  power-on-monitors
          Power on all monitors via DPMS
  spawn
          Spawn a command
  spawn-sh
          Spawn a command through the shell
  do-screen-transition
          Do a screen transition
  screenshot
          Open the screenshot UI
  screenshot-screen
          Screenshot the focused screen
  screenshot-window
          Screenshot the focused window
  toggle-keyboard-shortcuts-inhibit
          Enable or disable the keyboard shortcuts inhibitor (if any) for the focused surface
  close-window
          Close the focused window
  fullscreen-window
          Toggle fullscreen on the focused window
  toggle-windowed-fullscreen
          Toggle windowed (fake) fullscreen on the focused window
          Focus the window above or the bottommost window
  consume-or-expel-window-left
          Consume or expel the focused window left
  consume-or-expel-window-right
          Consume or expel the focused window right
  consume-window-into-column
          Consume the window to the right into the focused column
  expel-window-from-column
          Expel the focused window from the column
  swap-window-right
          Swap focused window with one to the right
  swap-window-left
          Swap focused window with one to the left
  toggle-column-tabbed-display
          Toggle the focused column between normal and tabbed display
  set-column-display
          Set the display mode of the focused column
  center-column
          Center the focused column on the screen
  center-window
          Center the focused window on the screen
  center-visible-columns
          Center all fully visible columns on the screen
  set-workspace-name
          Set the name of the focused workspace
  unset-workspace-name
          Unset the name of the focused workspace
  set-window-width
          Change the width of the focused window
  set-window-height
          Change the height of the focused window
  reset-window-height
          Reset the height of the focused window back to automatic
  switch-preset-column-width
          Switch between preset column widths
  switch-preset-column-width-back
          Switch between preset column widths backwards
  switch-preset-window-width
          Switch between preset window widths
  switch-preset-window-width-back
          Switch between preset window widths backwards
  switch-preset-window-height
          Switch between preset window heights
  switch-preset-window-height-back
          Switch between preset window heights backwards
  maximize-column
          Toggle the maximized state of the focused column
  maximize-window-to-edges
          Toggle the maximized-to-edges state of the focused window
  set-column-width
          Change the width of the focused column
  expand-column-to-available-width
          Expand the focused column to space not taken up by other fully visible columns
  switch-layout
          Switch between keyboard layouts
  show-hotkey-overlay
          Show the hotkey overlay
  toggle-debug-tint
          Toggle a debug tint on windows
  debug-toggle-opaque-regions
          Toggle visualization of render element opaque regions
  debug-toggle-damage
          Toggle visualization of output damage
  toggle-window-floating
          Move the focused window between the floating and the tiling layout
  move-window-to-floating
          Move the focused window to the floating layout
  move-window-to-tiling
          Move the focused window to the tiling layout
  focus-floating
          Switches focus to the floating layout
  focus-tiling
          Switches focus to the tiling layout
  switch-focus-between-floating-and-tiling
          Toggles the focus between the floating and the tiling layout
  move-floating-window
          Move the floating window on screen
  toggle-window-rule-opacity
          Toggle the opacity of the focused window
  set-dynamic-cast-window
          Set the dynamic cast target to the focused window
  set-dynamic-cast-monitor
          Set the dynamic cast target to the focused monitor
  clear-dynamic-cast-target
          Clear the dynamic cast target, making it show nothing
  toggle-overview
          Toggle (open/close) the Overview
  open-overview
          Open the Overview
  close-overview
          Close the Overview
  toggle-window-urgent
          Toggle urgent status of a window
  set-window-urgent
          Set urgent status of a window
  unset-window-urgent
          Unset urgent status of a window
  load-config-file
          Reload the config file
  help
          Print this message or the help of the given subcommand(s)




# Focus

Mod+M focus-window-or-monitor-up
Mod+N focus-window-or-monitor-down
Mod+E focus-column-or-monitor-left
Mod+I focus-column-or-monitor-right

focus-window-down-or-column-left
focus-window-down-or-column-right
focus-window-up-or-column-left
focus-window-up-or-column-right
focus-window-or-workspace-down
focus-window-or-workspace-up

Mod+Ctrl focus-workspace-down
Mod+Ctrl focus-workspace-up

Alt+M focus-monitor-left
Alt+N focus-monitor-right
Alt+E focus-monitor-down
Alt+I focus-monitor-up

# Move

Mod+Shift+M move-column-left-or-to-monitor-left
Mod+Shift+N move-column-right-or-to-monitor-right
Mod+Shift+E move-window-down-or-to-workspace-down
Mod+Shift+I move-window-up-or-to-workspace-up

move-window-to-workspace-down
move-window-to-workspace-up
move-workspace-down
move-workspace-up

move-window-to-monitor-left
move-window-to-monitor-right
move-window-to-monitor-down
move-window-to-monitor-up
move-window-to-monitor-previous
move-window-to-monitor-next
move-window-to-monitor
move-column-to-monitor-left
move-column-to-monitor-right
move-column-to-monitor-down
move-column-to-monitor-up
move-column-to-monitor-previous
move-column-to-monitor-next
move-column-to-monitor

## Move Workspace

Alt+Ctrl+M move-workspace-to-monitor-left
Alt+Ctrl+N move-workspace-to-monitor-right
Alt+Ctrl+E move-workspace-to-monitor-down
Alt+Ctrl+I move-workspace-to-monitor-up
