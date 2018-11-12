#!/usr/bin/env node

"use strict";

const readline = require("readline");

const INVALID_CHARACTERS = "\\/:*?\"<>|";

const make_valid_filename = function(line, extension) {
  line = line.trim();
  extension = extension.trim();
  line += extension;

  for (let i = 0; i < INVALID_CHARACTERS.length; ++i) {
    line = line.replace(INVALID_CHARACTERS[i], "_");
  }

  if (line.length === 0) {
    throw new Error("error: empty filename");
  }

  return line;
}

let extension = ""
if (process.argv.length > 2) {
  extension = process.argv[2]
}

try {
  readline.createInterface({
    input: process.stdin,
    output: process.stdout
  }).on("line", (line) => {
    line = make_valid_filename(line, extension);
    console.log(line);
  });
} catch (e) {
  if (e instanceof Error) {
    console.log(e.message);
    process.exit(1);
  } else {
    throw e;
  }
}
