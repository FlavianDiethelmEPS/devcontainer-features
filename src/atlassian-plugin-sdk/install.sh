#!/bin/sh
set -ex

SDK_BASE_URL=https://marketplace.atlassian.com/download/apps/1210993/

if [ "$VERSION" = "latest" ]; then
    SDK_URL="$SDK_BASE_URL"
else
    SDK_URL=$SDK_BASE_URL"version/"$(echo "$VERSION" | awk -F. '{print $1*100000000+$2*100000+$3*100}')
fi

apt update
apt upgrade -y
apt install -y curl
mkdir -p /usr/local/share/atlassian-plugin-sdk
curl -fLsS "$SDK_URL" | \
tar -xz -C /usr/local/share/atlassian-plugin-sdk --strip-components=1
find /usr/local/share/atlassian-plugin-sdk/**/bin \
    -maxdepth 1 \
    -not -name "*.*" \
    -type f \
    -exec chmod +x {} + \
    -exec ln -sf {} /usr/local/bin/ \;
exit 0