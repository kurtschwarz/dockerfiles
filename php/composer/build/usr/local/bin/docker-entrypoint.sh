#!/bin/sh

set -ex

export COMPOSER_HOME=/home/composer/.composer

exec su-exec composer /usr/local/bin/composer "${@}"
