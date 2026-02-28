#!/bin/bash

# Source environment setup
source "$(dirname "$0")/setup-env.sh"

PORT=4000

check_port_in_use() {
    # Fast + reliable: try to bind the port (fails with EADDRINUSE if something is listening).
    # This avoids `lsof` scanning /proc, which can be very slow in pixi/conda environments.
    ruby -e 'require "socket"; port = Integer(ENV.fetch("PORT")); begin; s = TCPServer.new("127.0.0.1", port); s.close; exit 1; rescue Errno::EADDRINUSE; exit 0; rescue; exit 2; end' \
        >/dev/null 2>&1
    local rc=$?
    if [ "${rc}" -eq 0 ]; then
        return 0
    fi
    if [ "${rc}" -eq 1 ]; then
        return 1
    fi

    echo "Warning: port availability check failed; continuing and letting Jekyll report any port conflicts."
    return 1
}

# Check if port is in use
if PORT="${PORT}" check_port_in_use; then
    echo "Port ${PORT} is in use. Please stop the process using it or use a different port."
    echo "You can check what's using it with: lsof -nP -iTCP:${PORT} -sTCP:LISTEN"
    exit 1
fi

# Start Jekyll server
echo "Starting Jekyll server on http://localhost:${PORT}"
bundle exec jekyll serve --port "${PORT}"
