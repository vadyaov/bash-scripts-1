#!/bin/bash

data=("$@")
for item in "${data[@]}"; do
  part1="${item%%=*}"
  part2="="
  part3="${item#*=}"
  echo -e "$title_bg_color$title_text_color$part1$reset"\
          "$part2"\
          "$value_bg_color$value_text_color$part3$reset"
done
