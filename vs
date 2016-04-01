#!/bin/sh
(exec tmux split-window -h "${@}" & disown; tmux select-pane -t :.-1)
