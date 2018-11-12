#!/usr/bin/env ruby

require "fcntl"

iencoding = "utf-8:utf-8"
oencoding = "utf-8:utf-8"
input_stream = IO.new(STDIN.fcntl(Fcntl::F_DUPFD), encoding: iencoding)
output_stream = IO.new(STDOUT.fcntl(Fcntl::F_DUPFD), encoding: oencoding)

lines = []

input_stream.each do |line|
  lines.push(line)
end

lines.sort!

lines.each do |line|
  print(line)
end
