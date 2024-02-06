#!/bin/bash

# Check for Python 3
if ! command -v python3 &> /dev/null
then
    echo "Python 3 could not be found. Please install Python 3."
    exit
fi

# Create virtual environment named 'venv' in the working directory
python3 -m venv venv

# Activate the virtual environment
source venv/bin/activate

# Upgrade pip to the latest version
pip install --upgrade pip

# Create a main.py file
echo "print('Hello, World!')" > main.py
echo "" > __init__.py

echo "Setup is complete."
