#!/bin/bash

source print.sh

if [ $# -ne 4 ]; then
  echo "Script needs 4 parameters"
else
  reg='^[1-6]$'
  if [[ $1 =~ $reg && $2 =~ $reg && $3 =~ $reg && $4 =~ $reg ]]; then
    echo "GOOD"
    # Определение цветовых переменных (зависит от параметров ввода)
    colors=("15" "196" "46" "21" "129" "0")
    title_bg_color="\e[48;5;${colors[$1 - 1]}}m"
    title_text_color="\e[38;5;${colors[$2 - 1]}m"
    value_bg_color="\e[48;5;${colors[$3 - 1]}m"
    value_text_color="\e[38;5;${colors[$4 - 1]}m"
    reset="\e[0m" # Сброс цветовых настроек
  else
    echo "All parameters should be numbers from 1 to 6."
  fi
fi
