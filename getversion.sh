#!/bin/bash
VERSION=$1
VERSIONDIR=$(pwd)/versions/$1

if [ -z "$1" ]; then
  echo "You must provide a version number, ex. 3.0.4"
  exit
fi

if [ ! -d "$VERSIONDIR" ]; then
  mkdir -p $VERSIONDIR
  cp run.sh $VERSIONDIR
  cp Dockerfile $VERSIONDIR 
  sed -ri 's/^(ENV VERSION) .*/\1 '"$VERSION"'/' $VERSIONDIR/Dockerfile
else
  echo "Version directory already exists"
fi
