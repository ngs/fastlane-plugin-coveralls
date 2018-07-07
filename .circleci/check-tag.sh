#!/bin/sh

set -eu

V=$(ruby -e 'require "./lib/fastlane/plugin/coveralls/version.rb"; puts "v#{Fastlane::Coveralls::VERSION}"')
[ $V = $CIRCLE_TAG ] || (
  echo "Fastlane::Coveralls::VERSION ${V} does not match with CIRCLE_TAG ${CIRCLE_TAG}"; exit 1
)
