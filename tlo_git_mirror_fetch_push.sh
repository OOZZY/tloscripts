#!/usr/bin/env bash
set -xeuo pipefail

while IFS='' read -r mirror_repo || [[ -n "${mirror_repo}" ]]
do
  pushd "${mirror_repo}"
  git fetch --all --prune
  git push --mirror
  popd
  echo
done
