#!/bin/sh
(exec tmux split-window "${@}" & disown; tmux select-pane -t :.-1)