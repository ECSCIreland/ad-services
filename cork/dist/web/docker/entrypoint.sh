#!/bin/bash

nohup tcpdump -i eth0 -w /tmp/pcaps/cork-%y-%m-%d_%H.%M.%S.pcap -G 30 &
nohup python3 /sync.py &
mkdir /tmp/pcaps
chmod a+w /tmp/pcaps


echo "Starting background tasks"
/app-cron.sh &

echo "Starting server"
apache2-foreground
