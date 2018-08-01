#!/bin/bash

[ $# -lt 2 ] && { echo "Usage $0: file_with_path out_dir"; exit 1; }

LINK="$2"
FULL_LINK=SYM_CNFS_LINKS/


while read f
do
    echo "$f"
    file=$(basename "$f")

    path="$PWD/$f"

    name=$(find $FULL_LINK -samefile "$path")

    echo "$path $name"


    # ln -s "$path" "$LINK/$name"
done < "$1"
