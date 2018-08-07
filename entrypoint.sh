#!/usr/bin/zsh
local ssh_files="$(find "$HOME"/.ssh -type f)"
if ! echo "$ssh_files" | egrep '(id_dsa|id_ecdsa|id_ed25519|id_rsa).pub'; then
  echo "No SSH keys detected!"
  echo "Make sure you've mounted your ssh keys at /root/.ssh so zplug can work"
  exit 1
fi
source ~/.zplug/init.zsh
source ~/.zsh/main.zsh
zplug install
chown -R root:root /root/.zplug
exec "$@"
