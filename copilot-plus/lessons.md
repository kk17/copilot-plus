# Lessons

## User Specified Lessons

- You have a python venv in ./.venv.
- Include info useful for debugging in the program output.
- Read the file before you try to edit it.
- Use LLM to perform flexible text understanding tasks. First test on a few files. After success, make it parallel.

## Cursor learned

- For website image paths, always use the correct relative path (e.g., 'images/filename.png') and ensure the images directory exists
- For search results, ensure proper handling of different character encodings (UTF-8) for international queries
- Add debug information to stderr while keeping the main output clean in stdout for better pipeline integration
- When using seaborn styles in matplotlib, use 'seaborn-v0_8' instead of 'seaborn' as the style name due to recent seaborn version changes
- Always check and verify the current working directory before executing commands or making file changes to avoid working in the wrong directory
- When mocking OpenAI API responses in tests:
  - OpenAI's types are more complex than they appear, with private fields and complex pagination
  - Instead of trying to mock complete response objects, consider mocking at a higher level (client methods)
  - Use `jest.MockedClass<typeof OpenAI>` for proper TypeScript typing of mocks
  - Be careful with `system_fingerprint` and other required fields in ChatCompletion responses
- When testing LLM provider APIs, prefer using a mock server over mocking the client library because:
  - It tests the actual HTTP request/response flow
  - It verifies error handling with real HTTP status codes
  - It allows debugging through request/response logs
  - It's closer to real-world usage scenarios
- When using Jest for testing servers, be aware that mocking at different levels (client vs server) can interfere with each other. Remove client mocks when testing with a mock server.
- When working with external APIs like Anthropic:
  - Always check the latest API types and response formats
  - Handle different content block types properly (e.g., text vs tool use blocks)
  - Add proper type checking and error handling for response content
  - Keep up with API version changes and model updates