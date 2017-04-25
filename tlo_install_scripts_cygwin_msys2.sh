#!/usr/bin/env bash
set -xeuo pipefail

rm -f /usr/local/bin/tlo-* /usr/local/bin/tlo_*
cp tlo_* /usr/local/bin
chmod +rx-w /usr/local/bin/tlo_*
