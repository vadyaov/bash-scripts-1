#!/bin/bash

colors=("7" "1" "2" "4" "5" "0")
title_bg_color="\033[4${colors[$1 - 1]}m"
title_text_color="\033[3${colors[$2 - 1]}m"
value_bg_color="\033[4${colors[$3 - 1]}m"
value_text_color="\033[3${colors[$4 - 1]}m"
reset="\033[0m" # Сброс цветовых настроек
