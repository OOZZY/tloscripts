#!/usr/bin/env bash
set -xeuo pipefail

function make_valid_filename_test {
  # one line
  test "`echo '\/:*?"<>|' | ${1}`" = '_________'
  test "`echo '\/:*?"<>|' | ${1} .pdf`" = '_________.pdf'
  test "`echo 'filename' | ${1}`" = 'filename'
  test "`echo 'filename' | ${1} .pdf`" = 'filename.pdf'

  # two lines
  test "`echo -e '\/:*?"<>|\nfilename' | ${1}`" = \
        $'_________\nfilename'
  test "`echo -e '\/:*?"<>|\n\/:*?"<>|' | ${1}`" = \
        $'_________\n_________'
  test "`echo -e '\/:*?"<>|\nfilename' | ${1} .pdf`" = \
        $'_________.pdf\nfilename.pdf'
  test "`echo -e '\/:*?"<>|\n\/:*?"<>|' | ${1} .pdf`" = \
        $'_________.pdf\n_________.pdf'

  # empty input
  ! echo '' | ${1}
}

make_valid_filename_test 'python3 ../tlo_make_valid_filename.py'
make_valid_filename_test 'ruby ../tlo_make_valid_filename.rb'
make_valid_filename_test 'node ../tlo_make_valid_filename.js'

echo all tests passed ...
