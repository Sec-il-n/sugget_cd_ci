#!/bin/sh
set -e
rm -f /docker_from_compose/tmp/pids/server.pid
exec "$@"
