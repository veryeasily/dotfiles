#!/usr/bin/zsh
source ~/.zplug/init.zsh
source ~/.zsh/main.zsh
zplug install
chown -R root:root /root/.zplug
exec "$@"
