#!/usr/bin/env bash

# Open a new session or attach to an unattached session
sessionName=$(tmux ls | grep -v attached | head -1 | cut -f1 -d:)
if [[ -z $sessionName ]]; then
  sessionName=$USER-$(date +%s)
  tmux new-session -d -s "$sessionName"
fi

tmux attach-session -t "$sessionName"
