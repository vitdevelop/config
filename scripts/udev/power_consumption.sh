#!/bin/bash
#
#

while true;
do

  voltage=$(cat /sys/class/power_supply/BAT0/voltage_now)
  amperage=$(cat /sys/class/power_supply/BAT0/current_now)

  echo $(bc -l <<< "scale=2; ($voltage*$amperage)/(1000000^2)") W
  sleep 1

  # clear previous line(after end of previous command)
  echo -ne "\033[0K\r"
done
