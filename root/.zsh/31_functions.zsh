function lju::bak bak() {
  [ -z $1 ] && echo "bak requires a file argument to backup" && return 1
  local new_name="$1.$(date -uIseconds).bak"
  echo "Creating backup $new_name"
  cp $1 $new_name
}

function lju::less_esc less_esc() {
  env LESS="-CQix4" less "$@"
}

# From
# https://github.com/knqyf263/pet/tree/e2b42ac4c7067ae474d54a16054b840848c11d85#bashzsh
function prev() {
  PREV=$(fc -lrn | head -n 1)
  sh -c "pet new `printf %q "$PREV"`"
}

function lju::noalias noalias() {
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
