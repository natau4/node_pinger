#!/usr/bin/env bash

set -x
set -e

mix deps.get
mix compile

MIX_ENV=test mix loadconfig

mix format --check-formatted

mix test --seed 0 --trace