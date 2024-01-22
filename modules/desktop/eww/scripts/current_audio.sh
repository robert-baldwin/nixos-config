#!/usr/bin/env bash

# Get list of all players
players=$(playerctl --list-all | rg -v "chromium")

# Iterate through each player and check if it is playing
for player in $players; do
  status=$(playerctl -p "$player" status)
  if [ "$status" == "Playing" ]; then
    playerctl -p "$player" metadata -f "{{ default(markup_escape(artist), markup_escape(album)) }} | {{ markup_escape(title) }}"
  fi
done
