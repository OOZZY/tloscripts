#!/usr/bin/env python3

import sys

INVALID_CHARACTERS = "\\/:*?\"<>|"

def make_valid_filename(line, extension):
    line = line.strip()
    extension = extension.strip()
    line += extension

    for c in INVALID_CHARACTERS:
        line = line.replace(c, "_")

    if not line:
        raise Exception("error: empty filename")

    return line

extension = ""
if len(sys.argv) > 1:
    extension = sys.argv[1]

try:
    for line in sys.stdin:
        line = make_valid_filename(line, extension)
        print(line)
except Exception as e:
    print(e)
    sys.exit(1)
