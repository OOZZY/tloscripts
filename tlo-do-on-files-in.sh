#!/usr/bin/env bash
set -euo pipefail

temp_file=$(mktemp)

find "${2}" -type f > "${temp_file}"

cat "${temp_file}" | while IFS='' read -r filepath || [[ -n "${filepath}" ]]; do
  "${1}" "${filepath}"
done

rm -f "${temp_file}"
