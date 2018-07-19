#!/bin/bash

dest_dir="$1"
find $dest_dir -type f -iname "*.cnf" -print0 | xargs -0 --max-procs=20 -L 1 $(dirname $0)/worker.sh
