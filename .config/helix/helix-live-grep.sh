#!/usr/bin/env bash


FILE_PATHS=$(live-grep --exit-on-execution | tr '\n' ' ' | sed 's/ *$//')


HELIX_PANE_ID=$(wezterm cli get-pane-direction Up)

if [[ -n "$FILE_PATHS" ]]; then
  
  wezterm cli send-text --pane-id "$HELIX_PANE_ID" --no-paste ":"

  
  wezterm cli send-text --pane-id "$HELIX_PANE_ID" "open $FILE_PATHS"

  
  printf "\r" | wezterm cli send-text --pane-id "$HELIX_PANE_ID" --no-paste
fi
