#!/usr/bin/env bash
set -xeuo pipefail

sudo iptables --table nat --append POSTROUTING --out-interface wlp3s0 -j MASQUERADE
sudo iptables --append FORWARD --in-interface enx884aeabfddee -j ACCEPT
sudo sh -c "echo 1 > /proc/sys/net/ipv4/ip_forward"
