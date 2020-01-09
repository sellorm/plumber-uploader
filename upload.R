# One-off demo (start server, curl, kill server):
#
# R -q -e 'plumber::plumb("upload.R")$run(port = 4321)' & R_PID=$! && sleep 1 && curl -v -F "upload=@dummy.pdf" "http://localhost:4321/upload" -H "accept: application/json" && kill $R_PID
#
#
# Query only:
#
# curl -v -F "upload=@dummy.pdf" "http://localhost:4321/upload" -H "accept: application/json"

#* @post /upload
upload <- function(req, res) {
  multipart <- mime::parse_multipart(req)
  
  in_file <- multipart$upload$name
  out_file <- multipart$upload$datapath
  
  list(
    "in" = list(
      path = jsonlite::unbox(in_file),
      size = jsonlite::unbox(fs::file_size(in_file)),
      md5 = jsonlite::unbox(digest::digest(in_file, file = TRUE))
    ),
    "out" = list(
      path = jsonlite::unbox(out_file),
      size = jsonlite::unbox(fs::file_size(out_file)),
      md5 = jsonlite::unbox(digest::digest(out_file, file = TRUE))
    )
  )
}
