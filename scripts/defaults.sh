#!/usr/bin/env bash
[ -z "$ENV" ] && ENV=production
[ -z "$SERVER_DIR" ] && SERVER_DIR="$( dirname $( dirname $( realpath ${BASH_SOURCE} ) ) )"
[ -z "$SERVER_PORT" ] && SERVER_PORT=3000
