#!/bin/bash

# Check for Python 3
if ! command -v python3 &> /dev/null
then
    echo "Python 3 could not be found. Please install Python 3."
    exit
fi

# Check for virtualenv
if ! command -v virtualenv &> /dev/null
then
    echo "virtualenv could not be found. Installing virtualenv..."
    pip install virtualenv
fi

# Create virtual environment named 'venv'
virtualenv venv

# Activate the virtual environment
source venv/bin/activate

# Install necessary Python packages
# pip install <package-name> # Uncomment and replace <package-name> with actual package names

# Create a main.py file
echo "print('Hello, World!')" > main.py

echo "Setup is complete. Your Python environment is ready, and main.py has been created."
