#!/usr/bin/env bash
set -xeuo pipefail

sudo docker rmi $(sudo docker images -aq)
