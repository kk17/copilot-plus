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
check `cppl help`
Have fun!

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

## Background

For detailed information about the motivation and technical details behind this project, check out the blog post: [Turning $20 into $500 - Transforming Cursor into Devin in One Hour](https://yage.ai/cursor-to-devin-en.html)

## License

MIT License
