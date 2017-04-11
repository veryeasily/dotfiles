#!/bin/bash
# Installs the dotfiles onto a newly provisioned server
#
# We use GNU stow to place the dotfiles, so here we install that
if [[ $(which apt-get) ]]; then
  which stow || sudo apt-get update && sudo apt-get install -y stow
elif [[ $(which yum) ]]; then
  which stow || yum install -y stow --enablerepo=epel
else
  echo "Neither apt-get nor yum found. Terminating..."
  exit 1
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

stow -t "$HOME"/ -S "$DIR"/root
