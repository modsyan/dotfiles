#!/bin/bash
# todo: use stow

config_file="config_mappings.txt"

if [[ ! -f $config_file ]]; then
  echo "Config file not found: $config_file"
  exit 1
fi

create_symlink() {
  local from="$1"
  local to="$2"
  
  eval from="$from"
  eval to="$to"

  ln -vfs "$from" "$to"
}


create_symlinks() {
  while IFS=":" read -r from to; do
    [[ -z "$from" || "$from" == \#* ]] && continue
    create_symlink "$from" "$to"
  done < "$config_file"
}

create_symlinks
