#!/bin/bash

source validate.sh

if validate_args "$@"; then
  source data.sh
  source colors.sh
  source print_data.sh "${data[@]}"
fi
