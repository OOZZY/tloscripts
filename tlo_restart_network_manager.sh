#!/usr/bin/env bash
set -xeuo pipefail

exec sudo service network-manager restart
