#!/bin/bash

# Check if project directory is provided
if [ -z "$1" ]; then
	echo "Usage: ./install.sh <project_directory>"
	exit 1
fi

PROJECT_DIR="$1"

# Check if dotnet is installed
if ! command -v dotnet &>/dev/null; then
	echo "Error: dotnet is not installed. Please install .NET SDK first."
	exit 1
fi

# Check if JetBrains CLI tools are installed
if ! command -v jb &>/dev/null; then
	echo "JetBrains CLI tools not found. Installing..."
	dotnet tool install -g JetBrains.ReSharper.GlobalTools
	if [ $? -ne 0 ]; then
		echo "Failed to install JetBrains CLI tools"
		exit 1
	fi
	echo "JetBrains CLI tools installed successfully"
else
	echo "JetBrains CLI tools already installed"
fi

# Check if project directory exists
if [ ! -d "$PROJECT_DIR" ]; then
	echo "Error: Project directory '$PROJECT_DIR' does not exist"
	exit 1
fi

# Check if .git directory exists
if [ ! -d "$PROJECT_DIR/.git" ]; then
	echo "Error: '$PROJECT_DIR' is not a git repository"
	exit 1
fi

# Copy pre-commit hook
echo "Installing pre-commit hook..."
cp pre-commit "$PROJECT_DIR/.git/hooks/"
chmod +x "$PROJECT_DIR/.git/hooks/pre-commit"

echo "Installation completed successfully!"
echo "Pre-commit hook has been installed in $PROJECT_DIR/.git/hooks/"
