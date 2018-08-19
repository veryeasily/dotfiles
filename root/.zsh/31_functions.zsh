function lju::bak bak() {
  [ -z $1 ] && echo "bak requires a file argument to backup" && return 1
  local new_name="$1.$(date -Iseconds).bak"
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
