#!/usr/bin/env bash

LOCK_FILE="$HOME/.cache/calendar.lock"

if [[ ! -f "$LOCK_FILE" ]]; then
  eww open calendar
  touch "$LOCK_FILE"
else
  rm "$LOCK_FILE"
  eww close calendar
  eww update reveal_date=false
fi
