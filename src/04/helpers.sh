#!/bin/bash

set_default_color() {
  local column_name="$1"
  local default_color="$2"

  if [ -z "${!column_name}" ]; then
    eval "$column_name=\"$default_color\""
  fi
}

configure_colors() {
  read -p "Enter 4 new arguments separated by spaces: " -a new_args

  echo "column1_background=${new_args[0]}" > colors.cfg
  echo "column1_font_color=${new_args[1]}" >> colors.cfg
  echo "column2_background=${new_args[2]}" >> colors.cfg
  echo "column2_font_color=${new_args[3]}" >> colors.cfg

  exec $0
}
