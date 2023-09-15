#!/bin/bash

# die() {
#   echo "$1" >&2
#   exit 1
# }

set_default_color() {
  local column_name="$1"
  local default_color="$2"

  if [ -z "${!column_name}" ]; then
    eval "$column_name=\"$default_color\""
  fi
}

print_colored_data() {
  local data=("$@")
  local clrs=("white" "red" "green" "blue" "purple" "black")
  for item in "${data[@]}"; do
    part1="${item%%=*}"
    part2="="
    part3="${item#*=}"
    echo -e "$title_bg_color$title_text_color$part1$reset"\
            "$part2"\
            "$value_bg_color$value_text_color$part3$reset"
  done

  if [[ $color1 == 6 ]]; then
    echo -e "\nColumn 1 background = default ("${clrs[$color1 - 1]}")"
  else
    echo -e "\nColumn 1 background = $color1 ("${clrs[$color1 - 1]}")"
  fi

  if [[ $color2 == 1 ]]; then
    echo "Column 1 font color = default ("${clrs[$color2 - 1]}")"
  else
    echo "Column 1 font color = $color2 ("${clrs[$color2 - 1]}")"
  fi

  if [[ $color3 == 2 ]]; then
    echo "Column 2 background = default ("${clrs[$color3 - 1]}")"
  else
    echo "Column 2 background = $color3 ("${clrs[$color3 - 1]}")"
  fi

  if [[ $color4 == 4 ]]; then
    echo "Column 1 font color = default ("${clrs[$color4 - 1]}")"
  else
    echo "Column 1 font color = $color4 ("${clrs[$color4 - 1]}")"
  fi
}

if [ $# -ne 0 ]; then
  echo "Script doesn't need parameters."
else
  source colors.cfg

  # default colors : 6 (black) 1 (white) 2 (red) 4 (blue)

  set_default_color column1_background 6
  set_default_color column1_font_color 1
  set_default_color column2_background 2
  set_default_color column2_font_color 4

  color1=$column1_background
  color2=$column1_font_color
  color3=$column2_background
  color4=$column2_font_color

  reg='^[1-6]$'
  if [[ $color1 =~ $reg && $color2 =~ $reg && $color3 =~ $reg && $color4 =~ $reg ]]; then
    if [[ $color1 -eq $color2 || $color3 -eq $color4 ]]; then
      echo "Background color and text color must be different."
      read -p "Do you want to run the script again with new arguments? (Y/N): " answer
      case "$answer" in
        [Yy]*)
          read -p "Enter 4 new arguments separated by spaces: " -a new_args

          echo "column1_background=${new_args[0]}" > colors.cfg
          echo "column1_font_color=${new_args[1]}" >> colors.cfg
          echo "column2_background=${new_args[2]}" >> colors.cfg
          echo "column2_font_color=${new_args[3]}" >> colors.cfg

          exec $0
          ;;
        *)
          echo "Exiting script."
          ;;
      esac
    else
      source data.sh
      source colors.sh $color1 $color2 $color3 $color4
      print_colored_data "${data[@]}"
    fi
  else
    echo "All parameters should be numbers from 1 to 6."
  fi
fi
