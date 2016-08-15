#!/bin/bash
TAGGED="$(curl -sSL 'https://api.github.com/repos/coreos/etcd/releases/latest' | awk -F '"' '$2 == "tag_name" { print $4 }')"
VERSION=${TAGGED:1}
VERSIONDIR=$(pwd)/versions/$VERSION

if [ ! -d "$VERSIONDIR" ]; then
  echo "Latest version of etcd is ${VERSION} -> and version directory ${VERSIONDIR} doesnt exist"
  sed -ri 's/^(ENV VERSION) .*/\1 '"$VERSION"'/' Dockerfile
  ./getversion.sh $VERSION
  git add . --all
  git commit -am "Update for etcd version ${VERSION}"
  git push
else
  echo "Latest version directory ${VERSIONDIR} already exists"
fi
