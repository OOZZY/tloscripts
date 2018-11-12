#!/usr/bin/env bash
set -xeuo pipefail

exec sudo docker rmi $(sudo docker images -aq)
