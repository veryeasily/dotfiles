FROM debian:9.5
RUN apt-get update \
      && apt-get install -y wget curl build-essential git zsh libncurses5-dev \
                            python3-pip locales \
      && mkdir -p /root/.vim/autoload /root/.vim/undo /root/.vim/backups \
                  /root/.vim/swaps \
      && mkdir -p /tmp/downloads \
      && cd /tmp/downloads \
      && wget https://github.com/BurntSushi/ripgrep/releases/download/0.8.1/ripgrep-0.8.1-x86_64-unknown-linux-musl.tar.gz \
      && tar -zxvf ripgrep-0.8.1-x86_64-unknown-linux-musl.tar.gz \
      && cd ripgrep-0.8.1-x86_64-unknown-linux-musl \
      && mv rg /usr/bin/rg && mv ./doc/rg.1 /usr/share/man/man1/rg.1 \
      && cd /tmp/downloads

COPY ["tools", "/tmp/downloads"]
RUN cd /tmp/downloads && ./install-vim.sh && ./install-tmux.sh

WORKDIR /root
ADD ["root", "/root/"]
ADD ["ssh", "/root/.ssh"]
RUN chown -R root:root /root/.ssh && vim +PlugInstall +qall \
      && git clone https://github.com/zplug/zplug /root/.zplug \
      && sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
      && locale-gen \
      && apt-get clean
ENV LANG=en_US.UTF-8  LANGUAGE=en_US:en  LC_ALL=en_US.UTF-8  
ENV SHELL=/bin/bash
ENV TERM=xterm-256color
ENTRYPOINT ["/root/entrypoint.sh"]
CMD ["/bin/bash"]
