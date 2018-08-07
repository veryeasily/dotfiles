function lju::bak bak() {
  [ -z $1 ] && echo "bak requires a file argument to backup" && return 1
  local new_name="$1.$(date -Iseconds).bak"
  echo "Creating backup $new_name"
  cp $1 $new_name
}

function lju::less_esc less_esc() {
  env LESS="-CQix4" less "$@"
}
