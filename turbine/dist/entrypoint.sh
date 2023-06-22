#!/bin/bash

nohup tcpdump -i ens5 -w /tmp/pcaps/turbine-%y-%m-%d_%H.%M.%S.pcap -G 30 &
nohup python3 /sync.py &

cron
socat -T180 tcp-l:10060,reuseaddr,fork EXEC:/service,pty,stderr,echo=0
