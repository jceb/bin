#!/bin/sh
exec tmux split-window "${@}" & disown
