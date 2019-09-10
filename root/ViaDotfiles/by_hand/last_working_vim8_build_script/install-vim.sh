#!/bin/bash
apt update && apt install -y python-dev python3-dev lua5.1 python3-pip
mkdir -p /tmp/downloads
pushd /tmp/downloads
wget https://github.com/vim/vim/archive/v8.1.0240.tar.gz
tar -zxvf v8.1.0240.tar.gz
cd vim-8.1.0240
./configure --with-features=huge \
            --enable-multibyte \
	    --enable-rubyinterp=yes \
	    --enable-pythoninterp=yes \
	    --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
	    --enable-python3interp=yes \
	    --with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu \
	    --enable-perlinterp=yes \
	    --enable-luainterp=yes \
            --enable-gui=no \
            --enable-cscope \
	   --prefix=/usr/local
make -j4 && make install
popd
pip3 install neovim
