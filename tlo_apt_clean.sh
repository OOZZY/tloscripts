#!/usr/bin/env bash
set -xeuo pipefail

sudo apt-get autoremove -V
sudo apt-get autoclean
sudo apt-get clean
sudo apt-get check
