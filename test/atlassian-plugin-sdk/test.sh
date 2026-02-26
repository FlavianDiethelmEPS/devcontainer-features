#!/bins/sh
set -ex
if ! command -v atlas-version >/dev/null 2>&1; then
    exit 1
elif ! command -v atlas-mvn >/dev/null 2>&1; then
    exit 1
elif ! command -v atlas-debug >/dev/null 2>&1; then
    exit 1
else
    exit 0
fi
