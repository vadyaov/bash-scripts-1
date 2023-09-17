#!/bin/bash

print_colored_data() {
  local data=("$@")
  for item in "${data[@]}"; do
    part1="${item%%=*}"
    part2="="
    part3="${item#*=}"
    echo -e "$title_bg_color$title_text_color$part1$reset"\
            "$part2"\
            "$value_bg_color$value_text_color$part3$reset"
  done

  echo ""
  print_color_info "Column 1 background" $color1 ${default_colors[0]}
  print_color_info "Column 1 font color" $color2 ${default_colors[1]}
  print_color_info "Column 2 background" $color3 ${default_colors[2]}
  print_color_info "Column 2 font color" $color4 ${default_colors[3]}
}

print_color_info() {
  local label=$1
  local color_code=$2
  local default_color=$3
  local clrs=("white" "red" "green" "blue" "purple" "black")

  if [[ "$color_code" == "$default_color" ]]; then
    echo "$label = default (${clrs[$color_code - 1]})"
  else
    echo "$label = $color_code (${clrs[$color_code - 1]})"
  fi
}
