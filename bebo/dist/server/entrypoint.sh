#!/bin/bash

nohup tcpdump -i eth0 -w /tmp/pcaps/bebo-%y-%m-%d_%H.%M.%S.pcap -G 30 &
nohup python3 /sync.py &
mkdir /tmp/pcaps
chmod a+w /tmp/pcaps

python3 main.py
