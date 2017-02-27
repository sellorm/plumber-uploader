Sys.setlocale('LC_ALL','C')
#* @post /upload
upload <- function(req, res){
  cat("---- New Request ----\n")
  file_path <- "./uploads/"
  posted_data <- req$postBody
  file_name <- gsub('\"', "", substr(posted_data[2], 55, 1000))
  file_length <- length(posted_data)-1
  file_content <- posted_data[5:file_length]
  file_to_write <- paste0(file_path, file_name)
  write(file_content, file = file_to_write)
  cat("File", file_to_write, "uploaded\n")
  return(file_to_write)
}
