#!/bin/bash

# Directory containing your .sh files (current directory)
script_dir="$(pwd)"

# File to store aliases (.bashrc for Bash)
alias_file="$HOME/.bashrc"

# Prefix for your alias, e.g., 'script_'
alias_prefix="script_"

# Temporary file to store new aliases
temp_alias_file="$(mktemp)"

# Start with a clean slate in the temp file
echo "# Aliases for .sh scripts" > "$temp_alias_file"

# Loop through the .sh files in the current directory, make them executable, and prepare new aliases
for script in "$script_dir"/*.sh; do
    # Make the script executable
    chmod +x "$script"

    # Extract the script's base name for the alias
    script_name=$(basename "$script" .sh)

    # Prepare alias definition with quoted path
    echo "alias ${alias_prefix}${script_name}='bash \"$script\"'" >> "$temp_alias_file"
done

# Remove existing aliases with the same prefix to prevent duplicates
sed -i.bak "/alias ${alias_prefix}/d" "$alias_file"

# Append new aliases to .bashrc
cat "$temp_alias_file" >> "$alias_file"

# Informing the user
echo "Updated aliases for scripts in the current directory have been added to your .bashrc. Please restart your terminal or source your .bashrc."

# Clean up temporary files
rm -f "$temp_alias_file" "${alias_file}.bak"
