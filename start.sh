#!/bin/bash
set -e

# Start CarveKit server using uvicorn
uvicorn carvekit.web.app:app --host 0.0.0.0 --port 5000 &

# Start nginx in foreground
nginx -g "daemon off;"

