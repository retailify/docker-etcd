#!/bin/bash
TAGGED="$(curl -sSL 'https://api.github.com/repos/coreos/etcd/releases' | awk -F '"' '$2 == "tag_name" { print $4 }')"

for version in $TAGGED; do
   ./getversion.sh ${version:1}
done

