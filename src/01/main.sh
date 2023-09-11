#!/bin/bash

if [[ $# -ne 1 ]]; then
  echo "The number of agruments must be 1"
elif [[ "$1" =~ ^[a-zA-Z]+$ ]]; then
  echo $1
else
  echo "Argument must be text"
fi
