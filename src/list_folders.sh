#!/bin/bash

list_folders() {
    local dir="$1"
    local prefix="$2"

    for item in "$dir"/*; do
        if [ -d "$item" ]; then
            local folder_name=$(basename "$item")
            local file_count=$(find "$item" -maxdepth 1 -type f | wc -l)
            
            if [ $file_count -eq 0 ]; then
                echo "${prefix}${folder_name}/ (empty folder)"
            else
                echo "${prefix}${folder_name}/ ($file_count files)"
            fi
            
            list_folders "$item" "${prefix}  "
        fi
    done
}

# Start listing from the current directory
list_folders "." ""
