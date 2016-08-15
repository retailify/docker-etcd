#!/bin/bash
TAGGED="$(curl -sSL 'https://api.github.com/repos/coreos/etcd/releases/latest' | awk -F '"' '$2 == "tag_name" { print $4 }')"
VERSION=${TAGGED:1}
VERSIONDIR=$(pwd)/versions/$VERSION

echo "${VERSION} -> ${VERSIONDIR}"

if [ ! -d "$VERSIONDIR" ]; then
  mkdir -p $VERSIONDIR
  cp run.sh $VERSIONDIR
  cp Dockerfile $VERSIONDIR 
  
else
  echo "Version directory already exists"
fi
