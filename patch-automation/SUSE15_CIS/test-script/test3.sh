#!/bin/bash

# Input file containing section numbers
input_file="skipped.txt"
yaml_files="../tasks/section*.yml"

# Check if input file exists
if [[ ! -f "$input_file" ]]; then
    echo "Error: Input file not found!"
    exit 1
fi

# Read each number from the input file
while read -r section_number; do
    if [[ -z "$section_number" ]]; then
        continue
    fi

    # Search for the section in YAML files
    grep -A 5 "${section_number}" $yaml_files
    echo "****************************************done**************************" 
    # Print results based on match
    #if [[ -n "$match" ]]; then
    #    echo "$section_number: FOUND"
    #else
    #    echo "$section_number: NOT FOUND"
    #fi
done < "$input_file"

