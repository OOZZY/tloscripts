#!/usr/bin/env bash
set -xeuo pipefail

sudo rm -f /usr/local/bin/tlo-* /usr/local/bin/tlo_*
sudo cp tlo_* /usr/local/bin
sudo chmod +rx-w /usr/local/bin/tlo_*
