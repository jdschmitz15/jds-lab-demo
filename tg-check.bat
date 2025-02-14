@echo off
REM Check if the PROGRAM_PATH argument is provided
if "%~1"=="" (
    echo Usage: %0 ^<PROGRAM_PATH^>
    exit /b 1
)
REM Check if the PROGRAM_PATH argument is provided
if "%~2"=="" (
    echo Usage: %0 ^<PROGRAM_PATH^> ^<PROGRAM_FILE^>
    exit /b 1
)

set PROGRAM_NAME=traffic-generator.exe
set PROGRAM_PATH=%~1
set PROGRAM_CMD=continuous
set PROGRAM_FILE=%~2

tasklist /FI "IMAGENAME eq %PROGRAM_NAME%" 2>NUL | find /I "%PROGRAM_NAME%" >NUL
if errorlevel 1 (
    echo %PROGRAM_NAME% is not running. Starting it now with options...
    start "" %PROGRAM_PATH%/%PROGRAM_NAME %PROGRAM_CMD% %PROGRAM_FILE%
) else (
    echo %PROGRAM_NAME% is running.
)

rem cmd to run the script every 10 minutes
rem schtasks /create /tn "Program Monitor Script" /tr "cmd.exe /c /start /min C:\Users\Administrator\Desktop\tg-check.bat" /sc minute /mo 5
