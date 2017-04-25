#!/usr/bin/env bash
set -xeuo pipefail

function get_title_test {
  # one word
  test "`echo '<title>title</title>' | ${1}`" = 'title'

  # strip
  test "`echo '<title> title </title>' | ${1}`" = 'title'

  # multiple words. split
  test "`echo '<title>one two</title>' | ${1}`" = 'one two'
  test "`echo $'<title>one\ntwo</title>' | ${1}`" = 'one two'

  # substitution
  test "`echo '<title>&amp;</title>' | ${1}`" = '&'
  test "`echo '<title>&#38;</title>' | ${1}`" = '&'
  test "`echo '<title>ti&nbsp;tle</title>' | ${1}`" = 'title'
  test "`echo '<title>ti&#160;tle</title>' | ${1}`" = 'title'
  test "`echo '<title>ti&shy;tle</title>' | ${1}`" = 'title'
  test "`echo '<title>ti&#173;tle</title>' | ${1}`" = 'title'

  test "`echo '<title>&#8211;</title>' | ${1}`" = '–'
  test "`echo '<title>&#8212;</title>' | ${1}`" = '—'

  # encoding
  test "`${1} iso-8859-1 < ./Google.html`" = 'Google'

  # empty input
  ! echo '' | ${1}

  # bad entity
  ! echo '<title>&#</title>' | ${1}
  ! echo '<title>&#38</title>' | ${1}

  # bad encoding
  ! ${1} < ./Google.html
  ! ${1} iso-8859 < ./Google.html

  # ndash and mdash
  test "`echo '<title>&ndash;</title>' | ${1}`" = '–'
  test "`echo '<title>&mdash;</title>' | ${1}`" = '—'

  # bull
  test "`echo '<title>&bull;</title>' | ${1}`" = '•'

  # rsaquo
  test "`echo '<title>&rsaquo;</title>' | ${1}`" = '›'
}

get_title_test 'python3 ../tlo_get_title.py'
get_title_test 'ruby ../tlo_get_title.rb'

echo all tests passed ...
