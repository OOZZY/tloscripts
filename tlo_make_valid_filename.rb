#!/usr/bin/env ruby

INVALID_CHARACTERS = '\\/:*?"<>|'

def make_valid_filename(line, extension)
  line = line.dup
  extension = extension.dup

  line.strip!
  extension.strip!
  line << extension

  INVALID_CHARACTERS.each_char do |c|
    line.gsub!(c, "_")
  end

  if line.empty?
    raise Exception.new("error: empty filename")
  end

  return line
end

extension = ""
if ARGV.length > 0
  extension = ARGV[0].dup
end

begin
  STDIN.each do |line|
    line = make_valid_filename(line, extension)
    puts line
  end
rescue Exception => e
  puts e.message
  exit(1)
end
