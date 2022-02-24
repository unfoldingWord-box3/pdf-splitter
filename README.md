# pdf-splitter

To run, install pdftk on your local machine:

https://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/

Then run the following:

```
./split.sh <path to origianl pdf> <prefix of new files> <bookmark level to split at>
```

Example:

```
./split kjv.pdf kjv 2
```

This above works with this repo as it includes kjv.pdf and will overwrite the existing kjv_*.pdf files. The 2 is the level of the bookmarks of the Bible books in the original PDF

