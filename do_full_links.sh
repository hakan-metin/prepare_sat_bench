#!/bin/bash

[ $# -lt 2 ] && { echo "Usage $0: file_with_path out_dir"; exit 1; }

LINK="$2"
while read f
do
    file=$(basename "$f")

    path="$PWD/$f"

    name="$file"
    if [[ -e "$LINK/$file" ]]; then
	try=1
	c=$(echo $file | sed -r "s/\.cnf/\-$try\.cnf/")
	while [[ -e "$LINK/$c" ]]; do
            try=$(($try+1))
	    c=$(echo $file | sed -r "s/\.cnf/\-$try\.cnf/")
	done
	name="$c"
    fi
    ln -s "$path" "$LINK/$name"
done < "$1"
