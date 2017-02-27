# plumber-uploader

A really hacky implementation of a file uploader in R using the [plumber](http://plumber.trestletech.com) package.

## Notes

* Currently only works with text based files. Binary files are corrupted on upload.
    + upload.html attempts to limit the types of file that can be uploaded to text based to help prevent corruption.
* The techniques used for extracting the file name and file body are not robust, and would be easily broken.
* There's nothing to stop you uploading a file over another file.
* I feel like plumber needs a `req$FILES` or something
* Maybe I'm missing something!
* Posting file data currently produces a warning (see below)

```
Warning in if (stri_startswith_fixed(body, "{")) { :
  the condition has length > 1 and only the first element will be used
Warning in if (stri_startswith_fixed(qs, "?")) { :
  the condition has length > 1 and only the first element will be used
```

## Warning

This is toy code at this point. Do not use!

## If you must...

Make sure the 'uploads' directory exists in the same directory as the code, then run:

```
library(plumber)
r <- plumb("./upload.R")
r$run(port=4000)
```

open upload.html in your browser and have at it.

Remember I warned you not to though ;)
