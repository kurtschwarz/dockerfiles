#!/bin/sh

set -e

export COMPOSER_HOME=/home/composer/.composer

exec su-exec composer /usr/local/bin/composer "${@}"
