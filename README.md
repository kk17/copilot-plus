# Devin.cursorrules

Transform your $20 Cursor/Windsurf into a Devin-like experience in one minute! This repository contains configuration files and tools that enhance your Cursor or Windsurf IDE with advanced agentic AI capabilities similar to Devin, including:

- Process planning and self-evolution
- Extended tool usage (web browsing, search, LLM-powered analysis)
- Automated execution (for Windsurf in Docker containers)

## Setup

1. Create Python virtual environment:
```bash
ln -s copilot-plus .copilot-plus
# Create a virtual environment in ./.venv
python3 -m venv ./.copilot-plus/.venv

# Activate the virtual environment
# On Unix/macOS:
source ./.copilot-plus/.venv/bin/activate
# On Windows:
.\.venv\Scripts\activate
```

1. Install dependencies:
```bash
# Install required packages
pip install -r ./.copilot-plus/requirements.txt

# Install Playwright's Chromium browser (required for web scraping)
python -m playwright install chromium
```

2. Install cpp(copilot-plus) command:
Run `./setup-cpp.sh` to install the cpp command

## Usage
Link copilot-plus to your project:
```bash
cpp cursor
cpp windsurf
cpp thinking
```

## Tools Included

- Web scraping with JavaScript support (using Playwright)
- Search engine integration (DuckDuckGo)
- LLM-powered text analysis
- Process planning and self-reflection capabilities

## Testing

The project includes comprehensive unit tests for all tools. To run the tests:

```bash
# Make sure you're in the virtual environment
source ./.copilot-plus/.venv/bin/activate  # On Windows: .\.venv\Scripts\activate

# Run all tests
PYTHONPATH=./.copilot-plus python -m unittest discover ./.copilot-plus/tests/
```

The test suite includes:
- Search engine tests (DuckDuckGo integration)
- Web scraper tests (Playwright-based scraping)
- LLM API tests (OpenAI integration)

## Background

For detailed information about the motivation and technical details behind this project, check out the blog post: [Turning $20 into $500 - Transforming Cursor into Devin in One Hour](https://yage.ai/cursor-to-devin-en.html)

## License

MIT License
