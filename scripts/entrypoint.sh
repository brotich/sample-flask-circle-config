#!/usr/bin/env bash
set -e

flask db migrate
flask db upgrade

exec "$@"
