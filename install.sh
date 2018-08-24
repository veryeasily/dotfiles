#!/bin/bash
# Installs the dotfiles onto a newly provisioned server
#
# We use GNU stow to place the dotfiles, so here we install that
# Command check notation borrowed from:
# http://stackoverflow.com/a/677212/1243823
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
if ! hash stow 2>/dev/null; then
  if hash apt-get 2>/dev/null; then
    sudo apt-get update && sudo apt-get install -y stow
  elif hash yum 2>/dev/null; then
    sudo yum install -y stow --enablerepo=epel
  else
    echo "Neither apt-get nor yum found. Terminating..."
    exit 1
  fi
fi
echo "stow -t $HOME/ -S $DIR/root"
./stow.sh
