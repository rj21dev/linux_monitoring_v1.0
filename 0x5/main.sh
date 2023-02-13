#!/bin/bash

. ./lib_top10

processing() {
	echo "Total number of folders (including all nested ones) = $(find $1 -type d 2> /dev/null | wc -l)"
	du -h /var/log 2>/dev/null | sort -hr | head -5 | \
	awk 'BEGIN {print "TOP 5 folders of maximum size arranged in descending order (path and size):"; i=1} \
	{printf("%d - %s, %sB\n", i, $2, $1); i++}'
	echo "Total number of files = $(find $1 -type f 2> /dev/null | wc -l)"
	echo "Number of:"
	echo "Configuration files (with the .conf extension) = $(find $1 -type f -name "*.conf" 2> /dev/null | wc -l)"
	echo "Text files = $(find $1 -type f -exec file . {} \; 2> /dev/null | grep -c ":.* text")"
	echo "Executable files = $(find $1 -type f -executable 2> /dev/null | wc -l)"
	echo "Log files (with the extension .log) = $(find $1 -type f -name "*.log" 2> /dev/null | wc -l)"
	echo "Archive files = $(find $1 -type f -exec file . {} \; 2> /dev/null | grep -c ":.* compressed")"
	echo "Symbolic links = $(find $1 -type l 2> /dev/null | wc -l)"
	print_top10_common $1
	print_top10_exec $1
}

if [ -n "$1" ]; then
	if [ -d "$1" ]; then
		if [ ${1: -1} = "/" ]; then
			TIMEFORMAT="Script execution time (in seconds) = %E"
			time {
				processing $1
			}
		else
			echo 'Error: The path should be followed by "/"'
		fi
	else
		echo "Error: Dir $1 doesn't exist"
	fi
else
	echo "./main PATH_TO_DIR"
fi
