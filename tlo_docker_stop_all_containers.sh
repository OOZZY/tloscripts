#!/usr/bin/env bash
set -xeuo pipefail

sudo docker stop $(sudo docker ps -q)
