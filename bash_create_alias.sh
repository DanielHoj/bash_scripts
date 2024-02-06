#!/bin/bash

# Directory containing your .sh files (current directory)
script_dir="$(pwd)"

# Name of this script
this_script="bash_create_alias.sh"

# File to store aliases (.bashrc for Bash)
alias_file="$HOME/.bashrc"

# Prefix for your alias, e.g., 'script_'
alias_prefix="script_"

# Find .sh files in the current directory
sh_files=("$script_dir"/*.sh)

# Check if .sh files exist in the directory
if [ -e "${sh_files[0]}" ]; then
    # Temporary file to store new aliases
    temp_alias_file="$(mktemp)"

    for script in "${sh_files[@]}"; do
        # Skip this script
        if [[ "$(basename "$script")" == "$this_script" ]]; then
            continue
        fi

        # Make the script executable
        chmod +x "$script"

        # Extract the script's base name for the alias
        script_name=$(basename "$script" .sh)

        # Prepare alias definition with quoted path
        echo "alias ${alias_prefix}${script_name}='bash \"$script\"'" >> "$temp_alias_file"
    done

    # Remove existing aliases with the same prefix to prevent duplicates
    sed -i.bak "/alias ${alias_prefix}/d" "$alias_file" && rm "${alias_file}.bak"

    # Append new aliases to .bashrc
    cat "$temp_alias_file" >> "$alias_file"

    # Informing the user
    echo "Updated aliases for scripts in the current directory have been added to your .bashrc."

    # Clean up temporary files
    rm -f "$temp_alias_file"

    source ~/.bashrc
else
    echo "No .sh scripts found in the current directory. No aliases were added."
fi
