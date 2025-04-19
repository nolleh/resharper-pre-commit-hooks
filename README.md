# ReSharper Pre-commit Hooks

This project provides a pre-commit hook for Git that automatically applies ReSharper code formatting rules using JetBrains CLI tools. It ensures consistent code formatting across your project by applying the rules defined in your `.DotSettings` files before each commit.

## Features

- Automatically detects and applies the nearest `.DotSettings` file for each staged file
- Uses JetBrains CLI tools to apply ReSharper formatting rules
- Prevents commits if files are reformatted, requiring you to review and stage the changes
- Supports nested `.DotSettings` files in different directories

## Prerequisites

- JetBrains CLI tools installed and available in your PATH

```bash
dotnet tool install -g JetBrains.ReSharper.GlobalTools
```

- `.DotSettings` file(s) in your project

## Installation

1. Copy the `pre-commit` file to your project's `.git/hooks` directory:

```bash
cp pre-commit .git/hooks/
chmod +x .git/hooks/pre-commit
```

2. Make sure you have a `.DotSettings` file in your project root or in the appropriate subdirectories.

## Usage

1. Stage your changes as usual with `git add`
2. When you run `git commit`, the hook will:
   - Find the appropriate `.DotSettings` file for each staged file
   - Apply ReSharper formatting rules using the JetBrains CLI
   - If any files are reformatted, the commit will be prevented
   - Review the reformatted files and stage them again if you're satisfied with the changes

## License

This project is open source and available under the MIT License.
