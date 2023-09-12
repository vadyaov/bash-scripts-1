#!/bin/bash

function print_info() {
out=$(cat <<EOF
HOSTNAME = `hostname`
TIMEZONE = `timedatectl show --property=Timezone --value` UTC `date +%:z`
USER = `whoami`
OS = `lsb_release -ds`
DATE = `date "+%d %B %Y %H:%M:%S"`
UPTIME = `uptime -p | sed 's/up//'`
UPTIME_SEC = `awk '{print $1}' /proc/uptime`
IP = `hostname -I | awk '{print $1}'`
MASK = $(ifconfig | grep -oP 'inet [\d.]+  netmask \K[\d.]+' | awk 'NR==2 {print}')
GATEWAY = $(ip route | grep default | awk '{print $3}')
RAM_TOTAL = `free -m | grep "Mem" | awk '{printf("%.3f GB", $2/1000)}'`
RAM_USED = `free -m | grep "Mem" | awk '{printf("%.3f GB", $3/1000)}'`
RAM_FREE = `free -m | grep "Mem" | awk '{printf("%.3f GB", $4/1000)}'`
SPACE_ROOT = `df / | awk 'NR==2 {printf("%.2f MB", $2/1024)}'`
SPACE_ROOT_USED = `df / | awk 'NR==2 {printf("%.2f MB", $3/1024)}'`
SPACE_ROOT_FREE = `df / | awk 'NR==2 {printf("%.2f MB", $4/1024)}'`
EOF
)
echo "$out"
}
