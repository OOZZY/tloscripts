#!/usr/bin/env bash
set -xeuo pipefail

OS="$(uname -o)"

if [ "${OS}" = "Cygwin" -o "${OS}" = "Msys" ]; then
  rm -f /usr/local/bin/tlo-* /usr/local/bin/tlo_*
  cp tlo-* /usr/local/bin
  chmod +rx-w /usr/local/bin/tlo-*
else
  sudo rm -f /usr/local/bin/tlo-* /usr/local/bin/tlo_*
  sudo cp tlo-* /usr/local/bin
  sudo chmod +rx-w /usr/local/bin/tlo-*
fi
