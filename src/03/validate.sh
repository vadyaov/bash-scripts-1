#!/bin/bash

validate_args() {
  local reg='^[1-6]$'
  if [ "$#" -ne 4 ]; then
    echo "Script needs 4 parameters"
    return 1
  elif [[ $1 =~ $reg && $2 =~ $reg && $3 =~ $reg && $4 =~ $reg ]]; then
    if [ "$1" -eq "$2" ] || [ "$3" -eq "$4" ]; then
      echo "Background color and text color must be different."
      read -p "Do you want to run the script again with new arguments? (Y/N):" answer
      case "$answer" in
        [Yy]*)
          read -p "Enter 4 new arguments separated by spaces:" new_args
          set -- $new_args
          exec "$0" "$@"
          ;;
      esac
    else
      return 0
    fi
  else
    echo "All parameters should be numbers from 1 to 6."
    return 1
  fi
}
