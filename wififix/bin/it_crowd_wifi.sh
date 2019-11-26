#!/bin/sh
now=$(date +"%T")
syslog -s -l info "5 second sleep to allow apple watch to unlock macbook"
sleep 5
syslog -s -l notice "Turning WiFi off and on again"
echo "Fixing MacOS stupidity at $now"
networksetup -setairportpower airport off
networksetup -setairportpower airport on
