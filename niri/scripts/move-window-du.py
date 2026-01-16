#!/usr/bin/env python3
"""
Usage:
    ./niri_move_updown.py [-mu|-md]
Source:
    https://github.com/YaLTeR/niri/issues/530
"""

import os
import sys
import json
import socket
import subprocess

# ----------------------------
# 1. Parse CLI Arguments
# ----------------------------
if len(sys.argv) != 2:
    print("Usage: {} [-mu|-md]".format(sys.argv[0]), file=sys.stderr)
    sys.exit(2)

arg = sys.argv[1]
action_map = {
    # We only accept Move Up and Move Down
    "-mu": ("move", "up"), 
    "-md": ("move", "down"),
}
if arg not in action_map:
    print("Usage: {} [-mu|-md]".format(sys.argv[0]), file=sys.stderr)
    sys.exit(2)

action_type, direction = action_map[arg]

# ----------------------------
# 2. IPC Helper and Mappings
# ----------------------------
NIRI_SOCKET = os.environ.get("NIRI_SOCKET")
if not NIRI_SOCKET:
    print("ERROR: NIRI_SOCKET not set in env.", file=sys.stderr)
    sys.exit(1)

def send_ipc(obj):
    """Sends JSON object to the Niri socket and returns the reply."""
    s = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
    try:
        s.connect(NIRI_SOCKET)
        s.settimeout(0.1) 
        data = json.dumps(obj, separators=(",", ":")) + "\n"
        s.sendall(data.encode())
        reply = s.recv(65536).decode(errors="replace").strip()
        s.close()
        return reply
    except Exception as e:
        return f"ERROR: Socket IPC failed: {e}"

def niri_msg_json(args):
    """Queries Niri state using niri msg -j."""
    p = subprocess.run(["niri", "msg", "-j"] + args, capture_output=True, text=True)
    if p.returncode != 0:
        error_msg = p.stderr.strip().splitlines()[0] if p.stderr else "Unknown error"
        raise RuntimeError(f"niri msg -j {' '.join(args)} failed: {error_msg}")
    return json.loads(p.stdout)

# IPC Mappings
# Only Up/Down actions are relevant
MOVE_ACTIONS = {"up": "MoveWindowUp", "down": "MoveWindowDown"}
MOVE_TO_MONITOR = {
    "up": "MoveWindowToMonitorUp", 
    "down": "MoveWindowToMonitorDown"
}

# ----------------------------
# 3. Mode Detection and Logic
# ----------------------------
ipc_cmd = None
variant = "Unknown"

try:
    # --- ATTEMPT 1: NORMAL MODE (Monitor Jump Logic) ---
    
    # Query state
    workspaces = niri_msg_json(["workspaces"])
    current_ws = next(ws for ws in workspaces if ws.get("is_focused"))
    ws_id = current_ws["id"]
    windows = niri_msg_json(["windows"])
    
    # Search for focused, tiled window in the current WS
    tiled_windows = [w for w in windows if w["workspace_id"] == ws_id and not w["is_floating"]]
    focused = next((w for w in tiled_windows if w.get("is_focused")), None)
    
    if not focused:
        # No focused window found -> Proceed to Overview Mode
        raise ValueError("No focused tiled window found (triggering Overview mode).")

    # Position calculation (only needed for Up/Down)
    focus_row = focused["layout"]["pos_in_scrolling_layout"][1]
    rows_in_col = [w["layout"]["pos_in_scrolling_layout"][1] for w in tiled_windows if w["layout"]["pos_in_scrolling_layout"][0] == focused["layout"]["pos_in_scrolling_layout"][0]]
    topmost, bottommost = min(rows_in_col), max(rows_in_col)

    # Normal Mode Decision (only Move Up/Down)
    if direction == "up":
        variant = MOVE_TO_MONITOR[direction] if focus_row == topmost else MOVE_ACTIONS[direction]
    elif direction == "down":
        variant = MOVE_TO_MONITOR[direction] if focus_row == bottommost else MOVE_ACTIONS[direction]
            
    ipc_cmd = {"Action": {variant: {}}}
    
except (RuntimeError, StopIteration, ValueError, IndexError) as e:
    # --- ATTEMPT 2: OVERVIEW MODE ASSUMED ---
    
    # In Overview mode, we always use the simple Move action (MoveWindowUp/Down)
    variant = MOVE_ACTIONS[direction]
    ipc_cmd = {"Action": {variant: {}}}
    

# ----------------------------
# 4. Execute Action
# ----------------------------
reply = send_ipc(ipc_cmd)

# Only print critical connection errors
if "ERROR: Socket IPC failed" in reply:
    print(f"CRITICAL ERROR: {reply}", file=sys.stderr)
