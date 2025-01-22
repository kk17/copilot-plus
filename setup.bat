@echo off
setlocal enabledelayedexpansion

:: Create Python virtual environment
echo Creating Python virtual environment...
mklink /D .copilot-plus copilot-plus 2>nul
python -m venv .\copilot-plus\.venv

:: Activate virtual environment
call .\copilot-plus\.venv\Scripts\activate.bat

:: Install dependencies
echo Installing dependencies...
pip install -r .\copilot-plus\requirements.txt

:: Install Playwright's Chromium browser
echo Installing Playwright's Chromium browser...
python -m playwright install chromium

:: Create Scripts directory if it doesn't exist
if not exist "%USERPROFILE%\AppData\Local\Programs\Python\Scripts" (
    mkdir "%USERPROFILE%\AppData\Local\Programs\Python\Scripts"
)

:: Copy cppl.cmd to Scripts directory
copy cppl.cmd "%USERPROFILE%\AppData\Local\Programs\Python\Scripts\cppl.cmd" >nul

:: Check if Scripts directory is in PATH
echo !PATH! | findstr /I /C:"%USERPROFILE%\AppData\Local\Programs\Python\Scripts" >nul
if errorlevel 1 (
    echo Warning: Python Scripts directory is not in your PATH
    echo Please add the following path to your system environment variables:
    echo %USERPROFILE%\AppData\Local\Programs\Python\Scripts
    echo Then restart your command prompt
)

echo Setup completed successfully!
echo You can now use 'cppl' command to link copilot-plus to your projects:
cppl help

pause