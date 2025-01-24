# Copilot Plus

Transform your Cursor/Windsurf/VSCode/Trae AI copilot into a Devin-like experience in one minute! This repository contains configuration files and tools that enhance your IDE with advanced agentic AI capabilities similar to Devin, including:

- Thinking-Claude: Chain of thoughts System Prompt
- Process planning and self-evolution
- Extended tool usage (web browsing, search, LLM-powered analysis)
- Automated execution (for Windsurf in Docker containers)

## Setup

Choose the appropriate setup script for your operating system:

### Linux/macOS
```bash
# Run the setup script
./setup.sh
```

### Windows
```batch
# Run the setup script
setup.bat
```

The setup script will:
1. Create and configure the Python virtual environment
2. Install required dependencies
3. Install Playwright's Chromium browser
4. Install the `cppl` command and check PATH configuration

## Usage
check `cppl help`.

In your IDE project, run: `cppl cursor/windsurf/code/trae` to link the resources to your project.

The command will link `./copilot-plus` to `.copilot-plus` and `./copilot-plus/Thinking-Claude/model_instructions/v5.1-extensive-20241201.md` to `.tc.md` in your project.

For cursor or windsurf, it will also create a link to `.cursorrules` or `.windsurfrules` in your project. For vscode or trae, it will create a `prompts.md` file in your project.

If you only want to use Thinking Claude, you can simply run: `cppl thinking`.

After you have linked the resources, you can now use them for the coding assistant.

Normally, when I start a new coding assistant task, I write my prompt in the `prompts.md` under the `User Prompts` section, then add the `.tc.md`, `prompts.md`, and necessary files to the context for the coding assistant. After that, I just use `Take the prompt from the prompts.md` to start the coding assistant.

Optional: You can add `.tc.md` and `.copilot-plus` to gloabal gitignore files to avoid the resources being pushed to remote.

## Tools Included

- Web scraping with JavaScript support (using Playwright)
- Search engine integration (DuckDuckGo)
- LLM-powered text analysis
- Process planning and self-reflection capabilities

## Testing

The project includes comprehensive unit tests for all tools. To run the tests:

```bash
# Make sure you're in the virtual environment
source ./copilot-plus/.venv/bin/activate  # On Windows: .\copilot-plus\.venv\Scripts\activate

# Run all tests
PYTHONPATH=./copilot-plus python -m unittest discover ./copilot-plus/tests/
```

The test suite includes:
- Search engine tests (DuckDuckGo integration)
- Web scraper tests (Playwright-based scraping)
- LLM API tests (OpenAI integration)

## Credit
This project is inspired by and developed based on the work of [grapeot/devin.cursorrules: Magic to turn Cursor/Windsurf into 90% of Devin](https://github.com/grapeot/devin.cursorrules).

## License

MIT License
