#!/bin/bash

start_time=$(date +%s.%N)

if [ $# -ne 1 ]; then
  echo "Only 1 parameter allowed"
  exit 1
fi

last_c="${1:${#1}-1}" # ${#1} - длина параметра
if [[ $last_c != "/" ]]; then
  echo "Incorrect input. Last symbol should be '/'"
  exit 2
fi

source commands.sh
source print_info.sh

end_time=$(date +%s.%N)
total_time=$(echo "$end_time - $start_time" | bc)

printf "Script execution time (in seconds) = %.3f" "$total_time"
