#!/usr/bin/env python3
# Cycle focus/swap through windows sorted by visual position on screen.
# direction: cw (j) = clockwise (right, down, left, up)
#            ccw (k) = counter-clockwise (left, down, right, up)
# usage: cycle-focus.py <cw|ccw> [focus|swap]
import json, subprocess, math, sys

direction = sys.argv[1]        # "cw" or "ccw"
action = sys.argv[2] if len(sys.argv) > 2 else "focus"

wins = json.loads(subprocess.check_output(['yabai', '-m', 'query', '--windows', '--space']))
visible = [w for w in wins if not w.get('is-minimized', False) and w.get('is-visible', True)]

if len(visible) <= 1:
    exit(0)

disp = json.loads(subprocess.check_output(['yabai', '-m', 'query', '--displays', '--display']))
cx = disp['frame']['x'] + disp['frame']['w'] / 2
cy = disp['frame']['y'] + disp['frame']['h'] / 2

def cw_key(w):
    wx = w['frame']['x'] + w['frame']['w'] / 2
    wy = w['frame']['y'] + w['frame']['h'] / 2
    a = math.atan2(wy - cy, wx - cx)
    # shift so 0 = top (12 o'clock), increasing clockwise
    return (a + math.pi / 2) % (2 * math.pi)

sorted_wins = sorted(visible, key=cw_key)
focused = next((w for w in sorted_wins if w.get('has-focus')), None)
if not focused:
    exit(1)

idx = sorted_wins.index(focused)
n = len(sorted_wins)
step = 1 if direction == 'cw' else -1
target = sorted_wins[(idx + step) % n]
subprocess.run(['yabai', '-m', 'window', f'--{action}', str(target['id'])])
