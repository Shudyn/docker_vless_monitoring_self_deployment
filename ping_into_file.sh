#!/bin/bash

timestamp=$(printf "%(%Y-%m-%d %T)T %s" -1 "$REPLY")

ping -c 20 8.8.8.8 > ~/ping.txt
iperf3 -c 85.113.62.252 -t 5 -P 3 > ~/iperf.txt

pingms=$( cat ~/ping.txt | grep -o '/[0-9]....[0-9]/' | cut -d "/" -f 2)
packetloss=$( cat  ~/ping.txt | grep -o '1\?[0-9]\?[0-9]%'  | grep -o '.*[^%]')
speed=$( cat ~/iperf.txt | tail -3 | grep -o '[0-9]\?[0-9]\?\.\?[0-9] Mbits' | grep -o '[0-9]\?[0-9]\?\.\?[0-9]' )

sudo docker exec postgre psql postgresql://postgres:ntnhbfylj[@172.17.0.6 -c "INSERT INTO pings (time, pingms) VALUES ('$timestamp', '$pingms')"
sudo docker exec postgre psql postgresql://postgres:ntnhbfylj[@172.17.0.6 -c "INSERT INTO packetloss (time, packetloss) VALUES ('$timestamp', '$packetloss')"
sudo docker exec postgre psql postgresql://postgres:ntnhbfylj[@172.17.0.6 -c "INSERT INTO speedtest (time, speed) VALUES ('$timestamp', '$speed')"
