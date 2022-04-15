#!/bin/env bash
#
# file location: /home/cybapunkz/.local/bin/thinkfan
# Author: Bhaskar K C <xlinkerz@gmail.com>
# Move this file to /usr/bin/thinkfan-config

sed -i '/^hwmon/d' /etc/thinkfan.conf

find /sys/devices -type f -name 'temp*_input' | xargs -I {} echo "hwmon {}" |
    sed -e '/thinkpad_hwmon\/hwmon\/hwmon[0-9]\/temp2_input$/ s/^/#\ /g' \
        >>/etc/thinkfan.conf

/usr/sbin/thinkfan $@