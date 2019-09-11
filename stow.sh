#!/bin/bash

# Set location to be ~/.dotfiles (or whatever)
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR" || exit 1

# Prevent us from accidentally absorbing Documents and .config
mkdir "$HOME/Documents" &>/dev/null || true
mkdir "$HOME/.config" &>/dev/null || true

# Symlink all of $HOME/.dotfiles/root/'s files to $HOME/
stow --override='.+' --target "$HOME" root
