#!/bin/bash
# Create symlinks from .git/hooks to our hooks
ln -sf ../../.githooks/pre-commit .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit