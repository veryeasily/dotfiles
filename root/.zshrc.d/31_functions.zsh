###
# FUNCTIONS

has() {
    type "${1:?too few arguments}" &>/dev/null
}

wslm() {
  local new_location
  if [[ "$PWD"/ != /home/mores/* ]]; then
    echo "Not in a subdirectory of home"
    return 1
  fi
  new_location="$(realpath --relative-to="/home/mores" .)/"
  echo "mv $@ /mnt/c/Users/mores/$new_location"
  mv $@ /mnt/c/Users/mores/$new_location
}

function pet-select() {
    BUFFER="$(pet exec --color --query "$LBUFFER")"
    CURSOR=$#BUFFER
    zle redisplay
}

zle -N pet-select
bindkey '^s' pet-select

# Borrowed from https://github.com/knqyf263/pet
function prev-add() {
  PREV=$(fc -lrn | head -n 1)
  sh -c "pet new `printf %q "$PREV"`"
}
