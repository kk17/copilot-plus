#!/bin/bash

# Find the real path of the script
if command -v realpath >/dev/null 2>&1; then
    COPILOT_PLUS_PATH=$(dirname $(realpath "$0"))
else
    COPILOT_PLUS_PATH=$(dirname $(readlink -f "$0"))
fi

# Default version for THINKING_CLAUDE_VERSION
: ${THINKING_CLAUDE_VERSION:="v5.1-extensive-20241201.md"}

# Function to print usage
print_usage() {
    echo "Usage: cppl <command>"
    echo "Commands:"
    echo "  cursor    - Link copilot-plus as .copilot-plus and agentrules as .cursorrules"
    echo "  windsurf  - Link copilot-plus as .copilot-plus and agentrules as .windsurfrules"
    echo "  thinking  - Link Thinking-Claude model instructions as .thinking-claude.md"
    echo "  thinking ls - List available Thinking-Claude model instructions"
    echo "  thinking <filename.md> - Link specific model instruction file"
    echo "  code     - Setup VSCode environment with prompts.md"
    echo "  vscode   - Same as 'code' command"
    echo "  help     - Show this help message"
}

# Function to create symbolic links for copilot-plus and rules
create_links() {
    local rules_suffix=$1
    [ ! -e ".copilot-plus" ] && ln -sf "${COPILOT_PLUS_PATH}/copilot-plus" .copilot-plus
    [ ! -e ".${rules_suffix}rules" ] && ln -sf "${COPILOT_PLUS_PATH}/copilot-plus/system-prompt.md" ".${rules_suffix}rules"
    handle_thinking
    echo "Created symbolic links for copilot-plus and ${rules_suffix} rules"
}

# Function to handle thinking command
handle_thinking() {
    local instruction_dir="${COPILOT_PLUS_PATH}/copilot-plus/Thinking-Claude/model_instructions"
    
    if [ ! -d "$instruction_dir" ]; then
        echo "Error: Thinking-Claude instructions directory not found"
        exit 1
    fi

    if [ "$1" = "ls" ]; then
        # List all files except changelog.md
        find "$instruction_dir" -type f -name "*.md" ! -name "changelog.md" -exec basename {} \;
    else
        if [ -e ".tc.md" ]; then
            rm .tc.md
            echo "Remove exist .tc.md"
        fi
        if [ -n "$1" ] && [ -f "$instruction_dir/$1" ]; then
            # Link specific file
            ln -sf "$instruction_dir/$1" .tc.md
            echo "Linked $1 as .tc.md"
        else
            # Link default version
            ln -sf "$instruction_dir/${THINKING_CLAUDE_VERSION}" .tc.md
            echo "Linked ${THINKING_CLAUDE_VERSION} as .tc.md"
        fi
    fi
}

# Function to setup vscode environment
setup_vscode() {
    [ ! -e ".copilot-plus" ] && ln -sf "${COPILOT_PLUS_PATH}/copilot-plus" .copilot-plus
    if [ ! -f "prompts.md" ]; then
        echo "# System Prompt" > prompts.md
        cat "${COPILOT_PLUS_PATH}/copilot-plus/system-prompt.md" >> prompts.md
        echo "\n# User Prompts" >> prompts.md
    fi
    handle_thinking
    echo "Setup VSCode environment completed"
}

# Main script logic
case "$1" in
    cursor)
        create_links "cursor"
        ;;
    windsurf)
        create_links "windsurf"
        ;;
    code|vscode)
        setup_vscode
        ;;
    thinking)
        shift
        handle_thinking "$1"
        ;;
    help|"")
        print_usage
        ;;
    *)
        echo "Error: Unknown command '$1'"
        print_usage
        exit 1
        ;;
esac