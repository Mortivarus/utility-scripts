#!/usr/bin/env bash
# Usage: ./extract_toc.sh file.pdf > toc.json

pdf="$1"

pdftk "$pdf" dump_data | \
awk -F': ' '
  BEGIN {
    print "["
    first=1
  }
  /^BookmarkTitle:/ {
    title=$2
    gsub(/"/, "\\\"", title)   # escape quotes
  }
  /^BookmarkLevel:/ { level=$2 }
  /^BookmarkPageNumber:/ {
    page=$2
    if (!first) { print "," }
    printf "  {\"title\": \"%s\", \"level\": %s, \"page\": %s}", title, level, page
    first=0
  }
  END {
    print "\n]"
  }
'
