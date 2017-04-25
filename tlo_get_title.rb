#!/usr/bin/env ruby

require "fcntl"

HTML_ENTITIES = [
  ["&quot;", "\""],
  ["&amp;", "&"],
  ["&lt;", "<"],
  ["&gt;", ">"],
  ["&nbsp;", ""],
  ["&iexcl;", "¡"],
  ["&cent;", "¢"],
  ["&pound;", "£"],
  ["&curren;", "¤"],
  ["&yen;", "¥"],
  ["&brvbar;", "¦"],
  ["&sect;", "§"],
  ["&uml;", "¨"],
  ["&copy;", "©"],
  ["&ordf;", "ª"],
  ["&laquo;", "«"],
  ["&not;", "¬"],
  ["&shy;", ""],
  ["&reg;", "®"],
  ["&macr;", "¯"],
  ["&deg;", "°"],
  ["&plusmn;", "±"],
  ["&sup2", "²"],
  ["&sup3;", "³"],
  ["&acute;", "´"],
  ["&micro;", "µ"],
  ["&para;", "¶"],
  ["&middot;", "·"],
  ["&cedil;", "¸"],
  ["&sup1;", "¹"],
  ["&ordm;", "º"],
  ["&raquo;", "»"],
  ["&frac14;", "¼"],
  ["&frac12;", "½"],
  ["&frac34;", "¾"],
  ["&iquest;", "¿"],
  ["&times;", "×"],
  ["&divide;", "÷"],
  ["&ETH;", "Ð"],
  ["&eth;", "ð"],
  ["&THORN;", "Þ"],
  ["&thorn;", "þ"],
  ["&AElig;", "Æ"],
  ["&aelig;", "æ"],
  ["&OElig;", "Œ"],
  ["&oelig;", "œ"],
  ["&Aring;", "Å"],
  ["&Oslash;", "Ø"],
  ["&Ccedil;", "Ç"],
  ["&ccedil;", "ç"],
  ["&szlig;", "ß"],
  ["&Ntilde;", "Ñ"],
  ["&ntilde;", "ñ"],
  ["&ndash;", "–"],
  ["&mdash;", "—"],
  ["&bull;", "•"],
  ["&rsaquo;", "›"]
]

SOFT_HYPHEN = 173

def replace_entities(title)
  title = title.dup

  HTML_ENTITIES.each do |entity|
    title.gsub!(entity[0], entity[1])
  end

  entity_start_index = title.index("&#")

  while entity_start_index != nil
    entity_end_index = title.index(";", entity_start_index)
    if entity_end_index.nil?
      raise Exception.new("error: bad entity")
    end
    entity = title[entity_start_index .. entity_end_index]

    entity_code_start_index = entity_start_index + "&#".length
    entity_code_end_index = entity_end_index - 1
    entity_code = title[entity_code_start_index .. entity_code_end_index]

    entity_code_int = entity_code.to_i
    entity_char = entity_code_int.chr(Encoding::UTF_8)

    is_space = entity_char == ' '
    is_printable_nonspace = (entity_char =~ /[[:print:]]/) &&
      (entity_char =~ /[[:space:]]/).nil? && (entity_code_int != SOFT_HYPHEN)

    if is_space || is_printable_nonspace
      title.gsub!(entity, entity_char)
    else
      title.gsub!(entity, "")
    end

    entity_start_index = title.index("&#")
  end

  return title
end

def get_title(html_text)
  html_text_lower = html_text.downcase
  opening_title_tag_index = html_text_lower.index("<title>")
  closing_title_tag_index = html_text_lower.index("</title>")

  if opening_title_tag_index != nil and closing_title_tag_index != nil
    title_start_index = opening_title_tag_index + "<title>".length
    title_end_index = closing_title_tag_index - 1
    title = html_text[title_start_index .. title_end_index]
    title = title.split.join(" ")
    title = replace_entities(title)
    return title
  end

  raise Exception.new("error: no title found")
end

iencoding = "utf-8:utf-8"
oencoding = "utf-8:utf-8"
if ARGV.length > 0
  iencoding = "#{ARGV[0].dup}:utf-8"
end

# see https://ruby-doc.org/core-2.3.2/IO.html
input_stream = IO.new(STDIN.fcntl(Fcntl::F_DUPFD), encoding: iencoding)
output_stream = IO.new(STDOUT.fcntl(Fcntl::F_DUPFD), encoding: oencoding)

begin
  html_text = input_stream.read
  title = get_title(html_text)
  output_stream.puts title
rescue Exception => e
  output_stream.puts e.message
  exit(1)
end
