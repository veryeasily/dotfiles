bak() {
  local new_name="$1.$(date -Iseconds).bak"
  echo "Creating backup $new_name"
  cp $1 $new_name
}
