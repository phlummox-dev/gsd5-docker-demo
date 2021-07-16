#!/usr/bin/env bash

if [ "$#" -ne 2 ]; then
  echo >&2 "expected 2 args: src repo dir, dest dir"
  exit 1  
fi

set -euo pipefail

repo_dir=$1
dest_dir=$2

mkdir -p $dest_dir/js
mkdir -p $dest_dir/tiddlers

cp $repo_dir/plugins/gsd5/core/plugin.info $dest_dir
cp `find  $repo_dir/plugins/gsd5/core/ -name '*.js'` $dest_dir/js

# rename conflicting dashboard.tid
if [ -f $repo_dir/plugins/gsd5/core/images/dashboard.tid ]; then
  mv $repo_dir/plugins/gsd5/core/images/dashboard.tid \
    $repo_dir/plugins/gsd5/core/images/dashboard-image.tid;
fi

cp `find  $repo_dir/plugins/gsd5/core/ -name '*.tid'` $dest_dir/tiddlers
cp `find  $repo_dir/plugins/gsd5/core/ -name '*.multids'` $dest_dir/tiddlers


