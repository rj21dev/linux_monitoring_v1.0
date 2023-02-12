#!/bin/bash
IFS=$'\n'
for var in $(cat $1); do
	echo $var
done
