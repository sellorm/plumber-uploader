# plumber-uploader

An implementation of a file uploader in R using the [plumber](https://www.rplumber.io/) package.

## Notes

* Works with text and binary files, relies on `mime::parse_multipart()`.

## Warning

This is toy code at this point. Do not use!

## If you must...

Run the following in `bash` for a one-off demo that starts the server, issues a request, and kills the server:

```bash
R -q -e 'plumber::plumb("upload.R")$run(port = 4321)' & R_PID=$!
sleep 1
curl -v -F "upload=@dummy.pdf" "http://localhost:4321/upload" -H "accept: application/json"
kill $R_PID
```

Output similar to the following should be produced:

```
$ curl -v -F "upload=@dummy.pdf" "http://localhost:4321/upload" -H "accept: application/json"
*   Trying 127.0.0.1...
* TCP_NODELAY set
* Connected to localhost (127.0.0.1) port 4321 (#0)
> POST /upload HTTP/1.1
> Host: localhost:4321
> User-Agent: curl/7.58.0
> accept: application/json
> Content-Length: 13458
> Content-Type: multipart/form-data; boundary=------------------------92529ccfdba99457
> Expect: 100-continue
> 
< HTTP/1.1 100 Continue
< Date: Mon, 06 Jan 2020 11:27:38 GMT
< HTTP/1.1 200 OK
< Date: Mon, 06 Jan 2020 11:27:38 GMT
< Content-Type: application/json
< Content-Length: 185
< 
* Connection #0 to host localhost left intact
{"in":{"path":"dummy.pdf","size":13264,"md5":"2942bfabb3d05332b66eb128e0842cff"},"out":{"path":"/tmp/RtmpDcjbJ1/file3a5b73746df5","size":13264,"md5":"2942bfabb3d05332b66eb128e0842cff"}}
```

## Digging deeper

To start a permanent server, run in R:

```r
plumber::plumb("upload.R")$run(port = 4321)
```

To query, run in your shell:

```bash
curl -v -F "upload=@dummy.pdf" "http://localhost:4321/upload" -H "accept: application/json"
```
