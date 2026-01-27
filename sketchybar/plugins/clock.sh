#!/usr/bin/env sh

# SketchyBar clock item script
# Expects SketchyBar env vars like $NAME

TIME_FMT="%H:%M"
DATE_FMT="%a %d %b"

time_str="$(date +"$TIME_FMT")"
date_str="$(date +"$DATE_FMT")"

# If you prefer a single-line clock, change this to: label="$time_str"
label="$time_str  $date_str"

sketchybar --set "$NAME" label="$label"
