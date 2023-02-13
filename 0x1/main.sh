#!/bin/bash

if [ $# -ne 1 ]; then
	echo "Usage ./main text_arg"
else
	if ! [[ $1 =~ ^[0-9]+$ ]]; then
		echo $1
	else
		echo "You can't input numbers"
	fi
fi
