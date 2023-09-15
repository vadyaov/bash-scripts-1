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
}

if [ $# -ne 4 ]; then
  echo "Script needs 4 parameters"
else
  reg='^[1-6]$'
  if [[ $1 =~ $reg && $2 =~ $reg && $3 =~ $reg && $4 =~ $reg ]]; then
    if [[ $1 -eq $2 || $3 -eq $4 ]]; then
      echo "Background color and text color must be different."
      read -p "Do you want to run the script again with new arguments? (Y/N): " answer
        case "$answer" in
          [Yy]*)
            read -p "Enter 4 new arguments separated by spaces: " new_args
            set -- $new_args
            exec "$0" "$@"
            ;;
          *)
            echo "Exiting script."
            ;;
        esac
    else
      source data.sh
      source colors.sh
      print_colored_data "${data[@]}"
    fi
  else
    echo "All parameters should be numbers from 1 to 6."
  fi
fi
