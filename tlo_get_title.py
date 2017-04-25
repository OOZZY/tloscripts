#!/usr/bin/env python3

import io
import sys

HTML_ENTITIES = (
    ("&quot;", "\""),
    ("&amp;", "&"),
    ("&lt;", "<"),
    ("&gt;", ">"),
    ("&nbsp;", ""),
    ("&iexcl;", "¡"),
    ("&cent;", "¢"),
    ("&pound;", "£"),
    ("&curren;", "¤"),
    ("&yen;", "¥"),
    ("&brvbar;", "¦"),
    ("&sect;", "§"),
    ("&uml;", "¨"),
    ("&copy;", "©"),
    ("&ordf;", "ª"),
    ("&laquo;", "«"),
    ("&not;", "¬"),
    ("&shy;", ""),
    ("&reg;", "®"),
    ("&macr;", "¯"),
    ("&deg;", "°"),
    ("&plusmn;", "±"),
    ("&sup2", "²"),
    ("&sup3;", "³"),
    ("&acute;", "´"),
    ("&micro;", "µ"),
    ("&para;", "¶"),
    ("&middot;", "·"),
    ("&cedil;", "¸"),
    ("&sup1;", "¹"),
    ("&ordm;", "º"),
    ("&raquo;", "»"),
    ("&frac14;", "¼"),
    ("&frac12;", "½"),
    ("&frac34;", "¾"),
    ("&iquest;", "¿"),
    ("&times;", "×"),
    ("&divide;", "÷"),
    ("&ETH;", "Ð"),
    ("&eth;", "ð"),
    ("&THORN;", "Þ"),
    ("&thorn;", "þ"),
    ("&AElig;", "Æ"),
    ("&aelig;", "æ"),
    ("&OElig;", "Œ"),
    ("&oelig;", "œ"),
    ("&Aring;", "Å"),
    ("&Oslash;", "Ø"),
    ("&Ccedil;", "Ç"),
    ("&ccedil;", "ç"),
    ("&szlig;", "ß"),
    ("&Ntilde;", "Ñ"),
    ("&ntilde;", "ñ"),
    ("&ndash;", "–"),
    ("&mdash;", "—"),
    ("&bull;", "•"),
    ("&rsaquo;", "›")
)

SOFT_HYPHEN = 173

def replace_entities(title):
    for entity in HTML_ENTITIES:
        title = title.replace(entity[0], entity[1])

    entity_start_index = title.find("&#")

    while entity_start_index != -1:
        entity_end_index = title.find(";", entity_start_index)
        if entity_end_index == -1:
            raise Exception("error: bad entity")
        entity_end_index += 1
        entity = title[entity_start_index:entity_end_index]

        entity_code_start_index = entity_start_index + len("&#")
        entity_code_end_index = entity_end_index - 1
        entity_code = title[entity_code_start_index:entity_code_end_index]

        entity_code_int = int(entity_code)
        entity_char = chr(entity_code_int)

        is_space = entity_char == ' '
        is_printable_nonspace = (entity_char.isprintable() and
            not entity_char.isspace() and (entity_code_int != SOFT_HYPHEN))

        if is_space or is_printable_nonspace:
            title = title.replace(entity, entity_char)
        else:
            title = title.replace(entity, "")

        entity_start_index = title.find("&#")

    return title

def get_title(html_text):
    html_text_lower = html_text.lower()
    opening_title_tag_index = html_text_lower.find("<title>")
    closing_title_tag_index = html_text_lower.find("</title>")

    if opening_title_tag_index != -1 and closing_title_tag_index != -1:
        title_start_index = opening_title_tag_index + len("<title>")
        title_end_index = closing_title_tag_index
        title = html_text[title_start_index:title_end_index]
        title = " ".join(title.split())
        title = replace_entities(title)
        return title

    raise Exception("error: no title found")

iencoding = "utf-8"
oencoding = "utf-8"
if len(sys.argv) > 1:
    iencoding = sys.argv[1]

# see https://docs.python.org/3/library/io.html
input_stream = io.TextIOWrapper(sys.stdin.buffer, encoding=iencoding)
output_stream = io.TextIOWrapper(sys.stdout.buffer, encoding=oencoding)

try:
    html_text = input_stream.read()
    title = get_title(html_text)
    print(title, file=output_stream)
except Exception as e:
    print(e, file=output_stream)
    sys.exit(1)
