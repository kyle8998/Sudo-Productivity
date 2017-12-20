#!/usr/bin/env bash

#tmux new-session -s "testing"
#tmux select-window -t testing:0
./keyServer.sh
tmux split-window -h ./master.sh
tmux split-window -v ./trigger.sh
tmux select-pane -L
tmux split-window -v ./slave.sh
