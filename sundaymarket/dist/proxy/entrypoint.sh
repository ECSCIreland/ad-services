#!/bin/bash

nohup tcpdump -i eth0 -w /tmp/pcaps/sundaymarket-%y-%m-%d_%H.%M.%S.pcap -G 30 &
nohup python3 /sync.py &
mkdir /tmp/pcaps
chmod a+w /tmp/pcaps

caddy run --config /etc/caddy/Caddyfile --adapter caddyfile
