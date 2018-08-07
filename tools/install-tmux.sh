#!/bin/bash
apt update && apt install -y libncurses5-dev libevent-dev
pushd /tmp/downloads
wget https://github.com/tmux/tmux/releases/download/2.7/tmux-2.7.tar.gz
tar -zxvf tmux-2.7.tar.gz && cd tmux-2.7
./configure && make -j4 && make install
popd
