#!/usr/bin/env bash
set -e

flask db upgrade

exec "$@"
