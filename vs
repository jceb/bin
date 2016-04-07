#!/bin/sh
tmux split-window -h "${@}"
tmux select-pane -t :.-1
