#!/bin/bash

default=1
column1_background=2
column1_font_color=4
column2_background=5
column2_font_color=1

if [ -s ./conf ]; then
	. ./conf
	default=0
fi

. ./sys_lib
. ./fn_lib

validator $column1_background $column1_font_color $column2_background $column2_font_color
set_colors $column1_background $column1_font_color $column2_background $column2_font_color
system_research
print_scheme
