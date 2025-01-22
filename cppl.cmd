@echo off
setlocal enabledelayedexpansion

:: Find the real path of the script
set "COPILOT_PLUS_PATH=%~dp0"
set "COPILOT_PLUS_PATH=%COPILOT_PLUS_PATH:~0,-1%"

:: Default version for THINKING_CLAUDE_VERSION
if not defined THINKING_CLAUDE_VERSION set "THINKING_CLAUDE_VERSION=v5.1-extensive-20241201.md"

:: Function to print usage
:print_usage
echo Usage: cppl ^<command^>
echo Commands:
echo   cursor    - Link copilot-plus as .copilot-plus and agentrules as .cursorrules
echo   windsurf  - Link copilot-plus as .copilot-plus and agentrules as .windsurfrules
echo   thinking  - Link Thinking-Claude model instructions as .thinking-claude.md
echo   thinking ls - List available Thinking-Claude model instructions
echo   thinking ^<filename.md^> - Link specific model instruction file
echo   code     - Setup VSCode environment with prompts.md
echo   vscode   - Same as 'code' command
echo   help     - Show this help message
goto :eof

:: Function to create symbolic links for copilot-plus and rules
:create_links
if not exist ".copilot-plus" mklink /D ".copilot-plus" "%COPILOT_PLUS_PATH%\copilot-plus"
if not exist ".%~1rules" mklink ".%~1rules" "%COPILOT_PLUS_PATH%\copilot-plus\system-prompt.md"
call :handle_thinking
echo Created symbolic links for copilot-plus and %~1 rules
goto :eof

:: Function to handle thinking command
:handle_thinking
set "instruction_dir=%COPILOT_PLUS_PATH%\copilot-plus\Thinking-Claude\model_instructions"

if not exist "%instruction_dir%" (
    echo Error: Thinking-Claude instructions directory not found
    exit /b 1
)

if "%~1"=="ls" (
    :: List all files except changelog.md
    dir /b "%instruction_dir%\*.md" | findstr /v /i "changelog.md"
) else (
    if exist ".tc.md" (
        del .tc.md
        echo Remove exist .tc.md
    )
    if not "%~1"=="" if exist "%instruction_dir%\%~1" (
        :: Link specific file
        mklink ".tc.md" "%instruction_dir%\%~1"
        echo Linked %~1 as .tc.md
    ) else (
        :: Link default version
        mklink ".tc.md" "%instruction_dir%\%THINKING_CLAUDE_VERSION%"
        echo Linked %THINKING_CLAUDE_VERSION% as .tc.md
    )
)
goto :eof

:: Function to setup vscode environment
:setup_vscode
if not exist ".copilot-plus" mklink /D ".copilot-plus" "%COPILOT_PLUS_PATH%\copilot-plus"
if not exist "prompts.md" (
    echo # System Prompt> prompts.md
    type "%COPILOT_PLUS_PATH%\copilot-plus\system-prompt.md" >> prompts.md
    echo.>> prompts.md
    echo # User Prompts>> prompts.md
)
call :handle_thinking
echo Setup VSCode environment completed
goto :eof

:: Main script logic
if "%1"=="" goto print_usage
if "%1"=="help" goto print_usage

if "%1"=="cursor" (
    call :create_links cursor
    goto :eof
)

if "%1"=="windsurf" (
    call :create_links windsurf
    goto :eof
)

if "%1"=="code" (
    call :setup_vscode
    goto :eof
)

if "%1"=="vscode" (
    call :setup_vscode
    goto :eof
)

if "%1"=="thinking" (
    call :handle_thinking %2
    goto :eof
)

echo Error: Unknown command '%1'
call :print_usage
exit /b 1