#!/bin/bash

# Directory containing your .sh files (current directory)
script_dir="."

# File to store aliases (.bashrc for Bash)
alias_file="$HOME/.bashrc"

# Prefix for your alias, e.g., 'script_' will create aliases like script_filename
alias_prefix="script_"

# Adding a comment to your .bashrc file for clarity
echo "# Aliases for .sh scripts" >> "$alias_file"

# Loop through the .sh files in the current directory, make them executable, and create aliases
for script in "$script_dir"/*.sh; do
    # Make the script executable
    chmod +x "$script"

    # Extract the script's base name for the alias
    script_name=$(basename "$script" .sh)

    # Add an alias to the .bashrc file
    echo "alias ${alias_prefix}${script_name}='bash $script'" >> "$alias_file"
done

# Informing the user
echo "Aliases for scripts in the current directory have been added to your .bashrc. Please restart your terminal or source your .bashrc."
