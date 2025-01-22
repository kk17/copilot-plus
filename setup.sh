#!/bin/bash

# Create Python virtual environment
echo "Creating Python virtual environment..."
ln -s "$PWD/copilot-plus" .copilot-plus 2>/dev/null
python3 -m venv ./copilot-plus/.venv

# Activate virtual environment
source ./copilot-plus/.venv/bin/activate

# Install dependencies
echo "Installing dependencies..."
pip install -r ./copilot-plus/requirements.txt

# Install Playwright's Chromium browser
echo "Installing Playwright's Chromium browser..."
python -m playwright install chromium

# Create ~/.local/bin if it doesn't exist
mkdir -p ~/.local/bin

# Create symbolic link for cppl command
ln -sf "$PWD/cppl.sh" ~/.local/bin/cppl

# Check if ~/.local/bin is in PATH
if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
    echo "Warning: ~/.local/bin is not in your PATH"
    echo "Please add the following line to your shell configuration file (~/.bashrc, ~/.zshrc, etc.):"
    echo "export PATH=\"\$HOME/.local/bin:\$PATH\""
    echo "Then restart your terminal or run: source ~/.bashrc (or your shell's config file)"
fi

echo "Setup completed successfully!"
echo "You can now use 'cppl' command to link copilot-plus to your projects."
cppl help
