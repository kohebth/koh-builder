#!/usr/bin/env bash

AUTO_VERSION=$(dirname "${BASH_SOURCE[0]}")/auto-version.sh
BUILD_OPT=$1
BUILD_ENV=$2

VALID_ENV=("dev" "rel")

# Require arguments
if [ -z "${BUILD_OPT}" ] || [ -z "${BUILD_ENV}" ] || [[ ! "${VALID_ENV[*]}" =~ ${BUILD_ENV} ]]; then
  echo "Usage: ./version-tag.sh [patch|minor|major] [dev|rel]"
  exit 2
fi

# Increase version number
VERSION=$(${AUTO_VERSION} --"${BUILD_OPT}" <version)
echo "${VERSION}" >version

# Create a tag
VERSION_TAG="v${VERSION}+${BUILD_ENV}"

# Commit version with the tag
git reset
git add version
git commit -m "Change version ${VERSION_TAG}"
git tag "${VERSION_TAG,,}"

echo "Committed, review it via \`git log\`"