#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5de3e5f2c3a9070019b0183f/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5de3e5f2c3a9070019b0183f
curl -s -X POST https://api.stackbit.com/project/5de3e5f2c3a9070019b0183f/webhook/build/ssgbuild > /dev/null
hugo
curl -s -X POST https://api.stackbit.com/project/5de3e5f2c3a9070019b0183f/webhook/build/publish > /dev/null
