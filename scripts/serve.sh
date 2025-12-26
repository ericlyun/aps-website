#!/bin/bash

# Source environment setup
source "$(dirname "$0")/setup-env.sh"

# Check if port 4000 is in use
if lsof -t -i:4000 > /dev/null 2>&1; then
    echo "Port 4000 is in use. Please stop the process using it or use a different port."
    echo "You can check what's using port 4000 with: lsof -i:4000"
    exit 1
fi

# Start Jekyll server
echo "Starting Jekyll server on http://localhost:4000"
bundle exec jekyll serve
