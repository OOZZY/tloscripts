#!/usr/bin/env bash
set -xeuo pipefail

# requires bash, wget, python3, wkhtmltopdf

for url in $@; do
  file="`wget -qO - "${url}" | tlo_get_title.py iso-8859-1 | \
    tlo_make_valid_filename.py .pdf`"
  wkhtmltopdf --header-font-size 8 --footer-font-size 8 \
    --header-left "[title]" --header-right  "[isodate] [time]" \
    --footer-left "[webpage]" --footer-right "[page] | [topage]" \
    "${url}" "${file}"
done
