#!/usr/bin/env bash

if [ $# -lt 1 ]; then
	echo "Usage: $0 pptx_file"
	exit 1
fi

abs_path=$(realpath $1)
directory="$(dirname $abs_path)"
file="$(basename $abs_path)"

cd $directory
docker run --user 1000 -v "$directory":/app pptx2png:latest "$file"