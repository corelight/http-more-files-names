HTTP More Filenames
-------------------

Bro normally only includes a filename in files.log for HTTP responses that 
include a Content-Disposition or Content-Type header specifying a filename.

This package extends that so a request for "example.com/some/file.txt" will use
"file.txt" as the filename.  It will do this as long as the response includes
an ETag header indicating a cacheable resource.  This heuristic should help
only match real file requests and not dynamic endpoints.
