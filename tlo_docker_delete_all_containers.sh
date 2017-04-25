#!/usr/bin/env bash
set -xeuo pipefail

sudo docker rm $(sudo docker ps -aq)
