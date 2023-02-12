#!/bin/bash

system_research() {
	echo -e "HOSTNAME\t= $(hostname)"
	echo -e "TIMEZONE\t= $(cat /etc/timezone) UTC $(date +%z)"
	echo -e "USER\t\t= $(whoami)"
	echo -e "OS\t\t= $(cat /etc/issue | awk '{printf $1" "$2" "$3}')"
	echo -e "DATE\t\t= $(date +"%d %B %Y %H:%M:%S")"
	echo -e "UPTIME\t\t= $(uptime | awk '{printf $3}')"
	echo -e "UPTIME_SEC\t= $(cat /proc/uptime | awk '{printf("%d sec", $1)}')"
	echo -e "IP\t\t= $(hostname -I)"
	echo -e "MASK\t\t= $(ifconfig | grep $(hostname -I) | awk '{printf $4}')"
	echo -e "GATEWAY\t\t= $(route | awk 'NR==4{printf $1}')"
	echo -e "RAM_TOTAL\t= $(free | awk 'NR==2{printf("%.3f Gb", $2/1024/1024)}')"
	echo -e "RAM_USED\t= $(free | awk 'NR==2{printf("%.3f Gb", $3/1024/1024)}')"
	echo -e "RAM_FREE\t= $(free | awk 'NR==2{printf("%.3f Gb", $4/1024/1024)}')"
	echo -e "SPACE_ROOT\t= $(df /root | awk 'NR==2{printf("%.2f Mb", $2/1024)}')"
	echo -e "SPACE_ROOT_USED\t= $(df /root | awk 'NR==2{printf("%.2f Mb", $3/1024)}')"
	echo -e "SPACE_ROOT_FREE\t= $(df /root | awk 'NR==2{printf("%.2f Mb", $4/1024)}')"
}

system_research
read -p "Save report?: " answer
case $answer in
	y|Y)
		exec 1> $(date +"%d_%B_%Y_%H_%M_%S.status")
		system_research ;;
	*)
		;;
esac

