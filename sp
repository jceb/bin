#!/bin/sh
tmux split-window "${@}"
tmux select-pane -t :.-1
