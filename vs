#!/bin/sh
tmux split-window -h "${@}" & disown; tmux select-pane -t :.-1
