#!/bin/bash

source print_info.sh
source helpers.sh
source colors.cfg

if [ $# -ne 0 ]; then
  echo "Script doesn't need parameters."
else
  # 6 (black) 1 (white) 2 (red) 4 (blue)
  default_colors=(6 1 2 4)
  set_default_color column1_background ${default_colors[0]}
  set_default_color column1_font_color ${default_colors[1]}
  set_default_color column2_background ${default_colors[2]}
  set_default_color column2_font_color ${default_colors[3]}

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
        [Yy])
          configure_colors
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
