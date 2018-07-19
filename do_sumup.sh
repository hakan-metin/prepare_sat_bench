#!/bin/bash


function compute() {
#    sed -i -r 's/=(.*)/="\1"/' "$1"
    source "$1"

    year=$(echo "$1" | cut -d'/' -f2)

    CSV_LINE="$CSV_LINE\"$year\","
    CSV_LINE="$CSV_LINE\"$path\","
    CSV_LINE="$CSV_LINE\"$file\","
    CSV_LINE="$CSV_LINE\"$md5sum\","
    CSV_LINE="$CSV_LINE\"$is_well_formed\","
    CSV_LINE="$CSV_LINE\"$num_vars\","
    CSV_LINE="$CSV_LINE\"$num_clauses\","
    CSV_LINE="$CSV_LINE\"$num_unary_clauses\","
    CSV_LINE="$CSV_LINE\"$num_binary_clauses\","
    CSV_LINE="$CSV_LINE\"$num_ternary_clauses\","
    CSV_LINE="$CSV_LINE\"$num_large_clauses\","
    CSV_LINE="$CSV_LINE\"$num_generators\","
    CSV_LINE="$CSV_LINE\"$percent_sym_vars\","
    CSV_LINE="$CSV_LINE\"$is_only_involution\","
    CSV_LINE="$CSV_LINE\"$is_inverting_perm\","
    CSV_LINE="$CSV_LINE\"$num_orbits\""

    echo $CSV_LINE >> cnfs_stats.csv
}


echo 'year, path, file, md5sum, is_well_formed, num_vars, num_clauses, num_unary_clauses, num_binary_clauses, num_ternary_clauses, num_large_clauses, num_generators, percent_sym_vars, is_only_involution, is_inverting_perm, num_orbits' > cnfs_stats.csv

export -f compute
dest_dir="results"
find $dest_dir -type f -iname "*.out" -print0 |\
    xargs -0 --max-procs=1 -L 1 -I {} bash -c "compute \"{}\""
