#!/bin/sh
set -e
for cmd in atlas-version atlas-mvn atlas-debug; do
  if ! command -v "$cmd" >/dev/null 2>&1; then
    echo "Missing required command: $cmd" >&2
    exit 1
  fi
done
exit 0
