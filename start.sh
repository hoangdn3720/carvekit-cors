#!/bin/bash
set -e

# Start CarveKit server
carvekit-serve &

# Start nginx in foreground
nginx -g "daemon off;"
