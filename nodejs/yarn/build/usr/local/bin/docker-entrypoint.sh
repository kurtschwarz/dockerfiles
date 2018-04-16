#!/bin/sh

set -e

exec su-exec yarn /opt/yarn/bin/yarn "${@}"
