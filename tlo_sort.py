#!/usr/bin/env python3

import io
import sys

iencoding = "utf-8"
oencoding = "utf-8"
input_stream = io.TextIOWrapper(sys.stdin.buffer, encoding=iencoding)
output_stream = io.TextIOWrapper(sys.stdout.buffer, encoding=oencoding)

lines = []

for line in input_stream:
    lines.append(line)

lines.sort()

for line in lines:
    print(line, file=output_stream, end='')
