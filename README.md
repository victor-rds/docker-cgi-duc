# docker-cgi-duc
DUC over CGI with lighttpd

## How to use 

First we need to build the index database

```docker run -v /path/to/database:/data -v /path/to/index:/target:ro victorrds/cgi-duc /usr/local/bin/scan.sh```

Then run the server to access the WebUI

```docker run -v /path/to/database:/data:ro -v /path/to/index:/target:ro -p 80:80 victorrds/cgi-duc```

Then access on port 80, the CGI script is not safe, so do not expose this to internet OR protect behind a reverse proxy