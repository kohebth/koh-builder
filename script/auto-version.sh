#!/usr/bin/env bash

VALID_OPT=("--patch" "--minor" "--major")
OPT=$1

# Validate arguments
if [ -z "${OPT}" ] || [[ ! "${VALID_OPT[*]}" =~ ${OPT} ]]; then
  echo "Usage: ./auto-version.sh [ --patch|--minor|--major ] [ <file | <<<1.2.3 ]"
  exit 2
fi

# Read version
VERSION=$(cat -)
VERSION_SPLIT=$(echo "${VERSION}" | tr '.' ' ')
read -ra VERSION_ARRAY <<<"$VERSION_SPLIT"

# Check format of version
if [ ${#VERSION_ARRAY[@]} -ne 3 ]; then
  echo "Version format is not supported: ${VERSION}"
  exit 2
fi

# Assign each part of version
MAJOR=${VERSION_ARRAY[0]}
MINOR=${VERSION_ARRAY[1]}
PATCH=${VERSION_ARRAY[2]}

# Increase version
case $OPT in
--major)
  MAJOR=$((MAJOR + 1))
  MINOR=0
  PATCH=0
  ;;
--minor)
  MINOR=$((MINOR + 1))
  PATCH=0
  ;;
--patch)
  PATCH=$((PATCH + 1))
  ;;
esac

# Output
echo $MAJOR.$MINOR.$PATCH
