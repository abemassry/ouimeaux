#!/bin/bash
cd /home/ubuntu/ouimeaux
source humidity.conf
PYNEST_COMMAND=$pynest_command
MIN_HUMIDITY="29"
humidity=`$PYNEST_COMMAND curhumid`

echo "The humidity is currently: $humidity"

if [ "$humidity" -lt "$MIN_HUMIDITY" ]; then
  echo "Turning humidifier on"
  /usr/local/bin/wemo switch "humidifier1" on
else
  echo "Turning humidifier off"
  /usr/local/bin/wemo switch "humidifier1" off
fi
