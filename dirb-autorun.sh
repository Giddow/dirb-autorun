#!/bin/bash

# Set the directory path where the text files are located
DIRECTORY="/opt/wordlist/filewithwordlist"

# Set the output directory path where the result files will be saved
OUTPUT_DIRECTORY="/opt/wordlist/filewithwordlist/results/"

# Set the website URL to scan
WEBSITE_URL="https://example.com"

# Loop through each file in the directory
# If file isn't txt, replace the txt by the suffix example: *.*
for file in $DIRECTORY/*.txt; do
  # Check if the file exists and is a regular file
  if [[ -f "$file" && -r "$file" ]]; then
    # Set the output file path with a timestamp suffix
    output_file="$OUTPUT_DIRECTORY/$(basename "${file%.*}")_$(date +"%Y%m%d_%H%M%S").txt"
    # Run dirb tool with the current file as input and scan the website URL with the wordlist and save the output to the output file
    dirb "$WEBSITE_URL" "$file" -N 502 -w -o "$output_file" -S -r
  fi
done
