#!/bin/bash

BASE_DIR='/data/hmetin/INSTANCES/'
ARCHIVE_DIR='/data/hmetin/INSTANCES/archives/'



function download() {
    url=$1
    name=$2

    wget -nc $url -O $name
}

function extract() {
    filename=$1
    dest_dir=$2/
    extension="${filename##*.}"

    mkdir -p $dest_dir

    case $extension in
        'zip')
            unzip $filename -d $dest_dir
            ;;
        'tgz')
            tar -xvf $filename -C $dest_dir
            ;;
        'tar')
            tar -xvf $filename -C $dest_dir
            ;;
        *)
            echo "UNKNWON EXTENSION $(basename $filename)"
    esac

    find $dest_dir -type f -iname "*.lzma" -print0 | xargs -0 --max-procs=0 -L 1 unlzma
    find $dest_dir -type f -iname "*.bz2" -print0 | xargs -0 --max-procs=0 -L 1 bzip2 -d
}



# 2018 - All
archive="$ARCHIVE_DIR/main18.zip"
dest_dir="$BASE_DIR/2018/all/"
bench_url="http://sat2018.forsyte.tuwien.ac.at/benchmarks/Main.zip"
download  $bench_url $archive
extract $archive $dest_dir

# 2017 - All
archive="$ARCHIVE_DIR/main17.zip"
dest_dir="$BASE_DIR/2017/all/"
bench_url="https://baldur.iti.kit.edu/sat-competition-2017/benchmarks/Main.zip"
download  $bench_url $archive
extract $archive $dest_dir

# 2016 - App
archive="$ARCHIVE_DIR/app16.zip"
dest_dir="$BASE_DIR/2016/app/"
download  $bench_url $archive
bench_url="https://baldur.iti.kit.edu/sat-competition-2016/downloads/app16.zip"
extract $archive $dest_dir

# 2016 - Hard
archive="$ARCHIVE_DIR/crafted16.zip"
dest_dir="$BASE_DIR/2016/hard/"
bench_url="https://baldur.iti.kit.edu/sat-competition-2016/downloads/crafted16.zip"
download  $bench_url $archive
extract $archive $dest_dir

# 2015 - All
archive="$ARCHIVE_DIR/crafted15.zip"
dest_dir="$BASE_DIR/2015/all/"
bench_url="https://baldur.iti.kit.edu/sat-race-2015/downloads/sr15bench.zip"
download  $bench_url $archive
extract $archive $dest_dir

# 2014 - App
archive="$ARCHIVE_DIR/app14.tar"
dest_dir="$BASE_DIR/2014/app/"
bench_url="http://www.satcompetition.org/2014/files/sc14-app.tar"
download  $bench_url $archive
extract $archive $dest_dir

# 2014 - Hard
archive="$ARCHIVE_DIR/sc14-crafted.tar"
dest_dir="$BASE_DIR/2014/hard/"
bench_url="http://www.satcompetition.org/2014/files/sc14-crafted.tar"
download  $bench_url $archive
extract $archive $dest_dir

# 2013 - App
archive="$ARCHIVE_DIR/app13.tgz"
dest_dir="$BASE_DIR/2013/app/"
bench_url="http://www.satcompetition.org/2013/files/sc13-benchmarks-application.tgz"
download  $bench_url $archive
extract $archive $dest_dir

# 2013 - Hard
archive="$ARCHIVE_DIR/crafted13.tgz"
dest_dir="$BASE_DIR/2013/hard/"
bench_url="http://www.satcompetition.org/2013/files/sc13-benchmarks-combinatorial.tgz"
download  $bench_url $archive
extract $archive $dest_dir

# 2012 - App
archive="$ARCHIVE_DIR/app12.tar"
dest_dir="$BASE_DIR/2012/app/"
bench_url="https://baldur.iti.kit.edu/SAT-Challenge-2012/downloads/sc2012-application.tar"
download  $bench_url $archive
extract $archive $dest_dir

# 2012 - Hard
archive="$ARCHIVE_DIR/crafted12.tar"
dest_dir="$BASE_DIR/2012/hard/"
bench_url="https://baldur.iti.kit.edu/SAT-Challenge-2012/downloads/sc2012-hard-combinatorial.tar"
download  $bench_url $archive
extract $archive $dest_dir
