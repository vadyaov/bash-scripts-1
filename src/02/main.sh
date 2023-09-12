#!/bin/bash

source print.sh

print_info

echo "Do you want to save information in file? (Y/n)"
read answer

if [[ "$answer" == "Y" || "$answer" == "y" ]]; then
  date=$(date "+%d_%m_%y_%H_%M_%S.status")
  print_info >> "$date"
fi
