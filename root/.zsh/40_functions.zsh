#!/bin/zsh
function datebak {
  date -Is | tr : _
}

function bak {
  [ -z "$1" ] && echo "bak requires a file argument to backup" && return 1

  readonly local new_name="$1.$(datebak).bak"

  echo "Creating backup $new_name"
  cp $1 $new_name
}

function less_esc {
  env LESS="-CQix4" less "$@"
}

# From
# https://github.com/knqyf263/pet/tree/e2b42ac4c7067ae474d54a16054b840848c11d85#bashzsh
function prev() {
  PREV=$(fc -lrn | head -n 1)
  sh -c "pet new -t `printf %q "$PREV"`"
}

function noalias() {
  local aliaskey aliasval
  aliaskey=$1
  aliasval=$(alias | grep -o -P '(?<=ls=).*' &>/dev/null)
  if [[ -z ${aliasval+x} ]]; then
    echo "Hmmm... $1 is already unaliased, no need to noalias. Aborted!"
    exit 1
  fi
  # unalias "${aliaskey}"
  # exec "$@"
  # alias "${aliaskey}" "${aliasval}"
}

# From https://gist.github.com/maxcnunes/7b5eae9cb884f126a70f
function crm() {
	docker-compose stop $1
	docker-compose rm --force $1
}

function aws_prompt_info() {
  printf "${AWS_PROFILE+(aws="$AWS_PROFILE") }"
}


function shed_mode() {
  export AWS_PROFILE=shed
}

function revolvy_mode() {
  export AWS_PROFILE=revolvy
}

function me_mode() {
  export AWS_PROFILE=veryveryeasily
}
