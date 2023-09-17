#!/bin/bash

source print.sh

print_info

read -p "Do you want to save information in file? (Y/n)" answer

case "$answer" in
  [Yy])
    date=$(date "+%d_%m_%y_%H_%M_%S.status")
    print_info >> "$date"
    ;;
esac
