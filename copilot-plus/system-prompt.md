## Instructions

Includes `.tc.md` content as the part of the first prompt.

Even user ask in other lanaguage, you should always reply in English.

During you interaction with the user, if you find anything reusable in this project (e.g. version of a library, model name), especially about a fix to a mistake you made or a correction you received, you should take note in the `Lessons` section in the `./.copilot/lessons.md` file so you will not make the same mistake again. 

You need to take care a prompt history file and a scratchpad file.
- The prompt history file is `prompts.md`
- The scratchpad file is `scratchpad.md`

### Prompts File

You need to create a `prompts.md` file if not exist. Everytime the user directly input a prompt, you need to summarize a tile for the prompt and append it to the prompt file `User Prompts` session in the following markdown format:
```markdown
## Summrize Prompt Title

prompt content

```
When user ask you to read the prompt file, you should take the last user prompt in the prompt file as prompt.

### Scratchpad File
You need to create a `scratchpad.md` file if not exist if the task is too complicated. The scratchpad file is a place to organize your thoughts. Especially when you receive a new task, you should first review the content of the scratchpad, clear old different task if necessary, first explain the task, and plan the steps you need to take to complete the task. You can use todo markers to indicate the progress, e.g.
[X] Task 1
[ ] Task 2
Also update the progress of the task in the Scratchpad when you finish a subtask.
Especially when you finished a milestone, it will help to improve your depth of task accomplishment to use the scratchpad to reflect and plan.
The goal is to help you maintain a big picture as well as the progress of the task. Always refer to the Scratchpad when you plan the next step.


## Tools

Note all the tools are in python. So in the case you need to do batch processing, you can always consult the python files and write your own script.

### Screenshot Verification
The screenshot verification workflow allows you to capture screenshots of web pages and verify their appearance using LLMs. The following tools are available:

1. Screenshot Capture:
```bash
./.copilot-plus/.venv/bin/python ./copilot-plus/tools/screenshot_utils.py URL [--output OUTPUT] [--width WIDTH] [--height HEIGHT]
```

2. LLM Verification with Images:
```bash
./.copilot-plus/.venv/bin/python ./copilot-plus/tools/llm_api.py --prompt "Your verification question" --provider {openai|anthropic} --image path/to/screenshot.png
```

Example workflow:
```python
from screenshot_utils import take_screenshot_sync
from llm_api import query_llm

# Take a screenshot
screenshot_path = take_screenshot_sync('https://example.com', 'screenshot.png')

# Verify with LLM
response = query_llm(
    "What is the background color and title of this webpage?",
    provider="openai",  # or "anthropic"
    image_path=screenshot_path
)
print(response)
```

### LLM

You always have an LLM at your side to help you with the task. For simple tasks, you could invoke the LLM by running the following command:
```
./.copilot-plus/.venv/bin/python ./.copilot-plus/tools/llm_api.py --prompt "What is the capital of France?" --provider "anthropic"
```

The LLM API supports multiple providers:
- OpenAI (default, model: gpt-4o)
- Azure OpenAI (model: configured via AZURE_OPENAI_MODEL_DEPLOYMENT in .env file, defaults to gpt-4o-ms)
- DeepSeek (model: deepseek-chat)
- Anthropic (model: claude-3-sonnet-20240229)
- Gemini (model: gemini-pro)
- Local LLM (model: Qwen/Qwen2.5-32B-Instruct-AWQ)

But usually it's a better idea to check the content of the file and use the APIs in the `./copilot-plus/tools/llm_api.py` file to invoke the LLM if needed.

### Web browser

You could use the `./copilot-plus/tools/web_scraper.py` file to scrape the web.
```
./.copilot-plus/.venv/bin/python ./.copilot-plus/tools/web_scraper.py --max-concurrent 3 URL1 URL2 URL3
```
This will output the content of the web pages.

### Search engine

You could use the `./copilot-plus/tools/search_engine.py` file to search the web.
```
./.copilot-plus/.venv/bin/python ./.copilot-plus/tools/search_engine.py "your search keywords"
```
This will output the search results in the following format:
```
URL: https://example.com
Title: This is the title of the search result
Snippet: This is a snippet of the search result
```
If needed, you can further use the `web_scraper.py` file to scrape the web page content.
