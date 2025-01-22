# Lessons

## User Specified Lessons

- You have a python venv in ./.venv.
- Include info useful for debugging in the program output.
- Read the file before you try to edit it.
- Use LLM to perform flexible text understanding tasks. First test on a few files. After success, make it parallel.
- You can use `git clone` to clone open source projects for code reference.

## Cursor learned

- For website image paths, always use the correct relative path (e.g., 'images/filename.png') and ensure the images directory exists
- For search results, ensure proper handling of different character encodings (UTF-8) for international queries
- Add debug information to stderr while keeping the main output clean in stdout for better pipeline integration
- When using seaborn styles in matplotlib, use 'seaborn-v0_8' instead of 'seaborn' as the style name due to recent seaborn version changes
- When testing LLM provider APIs, prefer using a mock server over mocking the client library because:
  - It tests the actual HTTP request/response flow
  - It verifies error handling with real HTTP status codes
  - It allows debugging through request/response logs
  - It's closer to real-world usage scenarios
