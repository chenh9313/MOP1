#!/bin/bash

# The gene you're looking for
gene="$1"  # Change this to your desired gene

# Loop over all block files (you can adjust the wildcard pattern to match your files)
for file_name in $2.txt; do  # Adjust the pattern if needed to match your files
    #echo "Processing file: $file_name"
    
    # Variable to store the current header
    current_header=""

    # Read the file line by line
    while IFS= read -r line; do
        # If the line starts with "## Alignment", it's the block header
        if echo "$line" | grep -q "^##"; then
            current_header="$line"
        fi

        # Check if the current line contains the gene
        if echo "$line" | grep -q "$gene"; then
            # Print the block header and the matching line
            echo "$current_header"
            echo "  $line"
            echo
        fi
    done < "$file_name"
done

