#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "$DIR" || exit 1

# Avoid annoying problem where _all_ of ~/.config ends up in the dotfiles repo
HOME_CONFIG="$HOME/.config"
[[ -e "$HOME_CONFIG" ]] || mkdir "$HOME_CONFIG"

stow --override='.+' --target "$HOME" root
