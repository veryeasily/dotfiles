#!/bin/sh
if command setxkbmap >/dev/null 2>&1; then
  setxkbmap -option caps:ctrl_modifier
fi
