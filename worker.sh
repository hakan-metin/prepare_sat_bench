#!/bin/bash

if [ $# -lt 1 ]; then
    echo "Usage $0: cnf" >&2
    exit 1
fi

CNF="$1"
BINARY="$HOME/FullStatsCNF"
TIMEOUT=1500

DIR=$(dirname "$CNF")
FILE=$(basename "$CNF")

RESULTS="results/$DIR"
mkdir -p "$RESULTS"

timeout --kill-after=5 $TIMEOUT $BINARY "$CNF" > "$RESULTS/$FILE.out"
