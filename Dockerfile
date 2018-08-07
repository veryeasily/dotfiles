FROM debian:9.5
RUN apt-get update \
      && apt-get install -y wget curl vim-nox git zsh libncurses5-dev \
                            python3-pip \
      && mkdir -p /root/.vim/autoload /root/.vim/undo /root/.vim/backups \
                  /root/.vim/swaps \
      && mkdir -p /tmp/downloads \
      && cd /tmp/downloads \
      && wget https://github.com/BurntSushi/ripgrep/releases/download/0.8.1/ripgrep-0.8.1-x86_64-unknown-linux-musl.tar.gz \
      && tar -zxvf ripgrep-0.8.1-x86_64-unknown-linux-musl.tar.gz \
      && cd ripgrep-0.8.1-x86_64-unknown-linux-musl \
      && mv rg /usr/bin/rg && mv ./doc/rg.1 /usr/share/man/man1/rg.1 \
      && cd /tmp/downloads \
      && wget https://github.com/vim/vim/archive/v8.1.0240.tar.gz \
      && tar -zxvf v8.1.0240.tar.gz && cd v8.1.0240.tar.gz \
      && ./configure && make && make install \
      && cd /root && rm -rf /tmp/downloads \
      && git clone https://github.com/zplug/zplug .zplug

WORKDIR /root
ADD ["root", "/root/"]
RUN tic ./screen-256color.ti && rm screen-256color.ti \
  && vim +PlugInstall +qall

RUN apt-get clean

ENV SHELL=/bin/bash
ENTRYPOINT ["/root/entrypoint.sh"]
CMD ["/bin/bash"]
