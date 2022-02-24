#!/bin/bash

infile=$1 # input pdf
outputprefix=$2
pdf_level=$3
book_offset=$4

[ -e "$infile" -a -n "$outputprefix" -a -n "$pdf_level" ] || exit 1 # Invalid args

page=0
book=1
title=""
prev_title=""
lines=$(pdftk "$infile" dump_data)
while read line; do
  if [[ $line == "BookmarkTitle: "* ]]; then
    prev_title=$title
    title=${line#* }
    title=${title// /_}
  elif [[ $line == "BookmarkLevel: "* ]]; then
    level=${line#* }
  elif [[ $level == $pdf_level && $line == "BookmarkPageNumber: "* ]]; then
    start=$page
    page=${line#* }
    if [[ $start != "0" ]]; then
      end=$[page-1]
      padded_book=$(printf "%02d" $book)
      book=$[book+1]
      echo "Creating ${outputprefix}_${padded_book}_${prev_title}.pdf"
      pdftk "$infile" cat 1 $start-$end output "${outputprefix}_${padded_book}_${prev_title}.pdf"
    fi
  fi
done <<< "$lines"
padded_book=$(printf "%02d\n" $book)
echo "Creating ${outputprefix}_${padded_book}_${title}.pdf"
pdftk "$infile" cat 1 $page-end output "${outputprefix}_${padded_book}_${title}.pdf"
echo "done"
