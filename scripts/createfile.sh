#!/bin/bash

if [ ! -f "../formats.txt" ]; then
  echo "Formats file formats.txt not found in the previous directory"
  exit 1
fi

filename_prefix="filename"

output_directory="../filetypes"

mkdir -p "$output_directory"

# Read the formats from the file and create corresponding files
while read -r format; do
  filename="$filename_prefix.$format"
  full_path="$output_directory/$filename"
  
  if [ -f "$full_path" ]; then
    echo "File already exists: $filename"
  else
    touch "$full_path"
    echo "Created file: $filename"
  fi
done < ../formats.txt

echo "Files created successfully."

