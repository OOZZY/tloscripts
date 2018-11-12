#!/usr/bin/env bash
# set -xeuo pipefail
set -euo pipefail

# to renames files in current directory such that all : in the filenames get
# replaced with -
# $ tlo-rename-files.sh : -

for file in *; do
  newfile=`echo "${file}" | sed s/"${1}"/"${2}"/g`
  # echo "${file}"
  # echo "${newfile}"
  if [ "${file}" != "${newfile}" ]; then
    echo "${file} -> ${newfile}"
  fi
done
