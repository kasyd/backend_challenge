#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /app/tmp/pids/server.pid

# Check if the database exists
if ! bundle exec rails db:version > /dev/null 2>&1; then
  echo "Database doesn't exist. Creating and migrating the database..."
  bundle exec rails db:create
  bundle exec rails db:migrate
fi

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
