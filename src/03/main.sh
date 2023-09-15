#!/bin/bash

    # 1 - white   4 - blue
    # 2 - red     5 - purple
    # 3 - green   6 - black

    # $1 - цвет фона названий значений
    # $2 - цвет шрифта названий значений
    # $3 - цвет фона значений (после знака '=')
    # $4 - цвет шрифта значений (после знака '=')

if [ $# -ne 4 ]; then
  echo "Script needs 4 parameters"
else
  reg='^[1-6]$'
  if [[ $1 =~ $reg && $2 =~ $reg && $3 =~ $reg && $4 =~ $reg ]]; then
    if [[ $1 -eq $2 || $3 -eq $4 ]]; then
      echo "Background color and text color must be different."
    else
      source data.sh
      source colors.sh
        # printf "%s\n" "${data[@]}"
        for item in "${data[@]}"; do
          part1="${item%%=*}"
          part2="="
          part3="${item#*=}"
          echo -e "$title_bg_color$title_text_color$part1$reset"\
                  "$part2"\
                  "$value_bg_color$value_text_color$part3$reset"
        done
    fi
  else
    echo "All parameters should be numbers from 1 to 6."
  fi
fi
