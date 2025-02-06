#!/usr/bin/env bash

if [ $# -lt 1 ]; then
    echo "Usage: $0 /path/to/pptx_file"
    exit 1
fi

input_file="$1"
directory="$(dirname "$input_file")"
file="$(basename "$input_file")"
filename="${file%.*}"  # Remove the extension

output_dir="/app/${filename}_images"
mkdir -p "$output_dir"

echo "Converting: $input_file"
echo "Output Directory: $output_dir"

#libreoffice --headless --convert-to pdf "$input_file" --outdir "$directory"
libreoffice --headless "$input_file" macro:///ExpandAnimations.ExpandAnimations.test
pdf_file="${directory}/${filename}.pdf"

if [ -f "$pdf_file" ]; then
    pdftoppm "$pdf_file" "$output_dir/output" -png
    echo "Conversion completed. Images saved in $output_dir"

    rm "$pdf_file"
else
    echo "Error: PDF conversion failed!"
    exit 1
fi
