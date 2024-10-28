#!/bin/bash
wall "
#Architecture: $(uname -a)
#CPU physical : $(lscpu | grep "Socket(s):" | awk '{print $2}')
#vCPU : $(lscpu | grep "^CPU(s):" | awk '{print $2}')
#Memory Usage: $(free -m | awk '/Mem:/ {printf "%d/%dMB (%.2f%%)\n", $3, $2, $3/$2 * 100}')
#Disk Usage : $(df -h --total | awk '/total/ {printf "%s/%s (%s)", $3, $2, $5}')
#CPU load: $(w | head -1 | tail -1 | awk '{printf "%.1f", 100 - $15}')
#Last boot: $(who -b | awk '{print $3, $4}')
#LVM use: $(lsblk | grep "lvm" &> /dev/null && echo "yes" || echo "no")
#Connections TCP : $(ss -t | grep ESTAB | wc -l) ESTABLISHED
#User log : $(who | wc -l)
#Network : IP $(ip -4 addr show dev enp0s3 | grep inet | awk '{print $2}' | cut -d'/' -f1) ($(ip link show dev enp0s3 | grep link/ether | awk '{print $2}'))
#Sudo : $(grep -c 'COMMAND' /var/log/sudo/sudolog) cmd
"

