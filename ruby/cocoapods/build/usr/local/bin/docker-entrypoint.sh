#!/bin/sh

set -e

POD=$(su-exec cocoapods ruby -rubygems -e 'puts Gem.user_dir')/bin/pod

su-exec cocoapods $POD $@
