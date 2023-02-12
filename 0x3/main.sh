#!/bin/bash

. ./sys_lib
. ./fn_lib

if [ $# != 4 ]; then
        echo "./main.sh KEY_BG_COLOR KEY_FONT_COLOR VAL_BG_COLOR VAL_FONT_COLOR"
        echo "1 - white, 2 -red, 3 - green, 4 - blue, 5 - purple, 6 - black"
        exit 1
else
        validator $1 $2 $3 $4
        set_colors $1 $2 $3 $4
	system_research
fi
