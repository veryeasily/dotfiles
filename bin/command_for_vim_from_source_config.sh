#!/bin/bash

./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp=dynamic \
            --enable-pythoninterp=dynamic \
            --with-python-config-dir="$(python-config --configdir)" \
            --enable-python3interp=dynamic \
            --with-python3-config-dir="$(python3-config --configdir)" \
            --enable-perlinterp=dynamic \
            --enable-luainterp=dynamic \
            --enable-gui=gtk3 \
            --enable-cscope \
            --enable-termtruecolor \
            --prefix=/usr/local

make -j 16 VIMRUNTIMEDIR=/usr/local/share/vim/vim81
