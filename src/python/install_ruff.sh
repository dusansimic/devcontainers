#!/bin/bash
set -e

ORG_PROJ="astral-sh/ruff"
RELTAG="latest"

API_JSON=$(mktemp /tmp/api-XXXXXXXX.json)
API="https://api.github.com/repos/${ORG_PROJ}/releases/${RELTAG}"

curl --fail --retry 5 --retry-delay 5 --retry-all-errors -sL ${API} -o ${API_JSON}
TGZ_URLS=($(cat ${API_JSON} |
  jq \
    -r \
    '.assets | sort_by(.created_at) | reverse | .[] | select(.name|test("x86_64")) | select(.name|test("linux-gnu.tar.gz$")) | .browser_download_url'
))

TGZ_FILE=$(mktemp /tmp/XXXXXXXX.tgz)

curl --fail --retry 5 --retry-delay 5 --retry-all-errors -sL ${TGZ_URLS} -o ${TGZ_FILE}

tar -xzf ${TGZ_FILE} --strip-components=1 -C /usr/bin

# cleanup

rm $API_JSON $TGZ_FILE
