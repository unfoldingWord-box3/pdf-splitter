# pdf-splitter

## To run

1. Install pdftk on your local machine: https://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/

2. Clone this repo:

```
git clone https://github.com/unfoldingWord-box3/pdf-splitter.git
cd pdf-splitter
``

3. Run this splitter with this sytax:

```
./split_pdf.sh <path to origianl pdf> <prefix of new files> <bookmark level to split at>
```

Example:

```
./split_pdf.sh demo/kjv.pdf kjv 2
```

This above demo command will put the split PDFs in the root of this repo, but should match the demo/kjv_*.pdf files


## Tweeking

### Book #

You may need to tweek the script it self if you need to change things such as what number to start counting the books if there are other sections you don't want that have the same BookmarkLevel as the one you give it, such as a TOC page or other content. Change the line `book=1` to a lower number to offset this.

### Static pages at beginning

If you don't want the cover page added, which you see in the `pdftk "$infile" cat 1 ...` lines, remove the `1 ` or change it to what pages you want. Pages are separated by spaces, so if you wanted page 1 and 3: `pdftk "$infile" cat 1 3 ...` where `...` is the remaining part that you should NOT change.
