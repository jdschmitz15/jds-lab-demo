@echo off
set PROGRAM_NAME=traffic-generator.exe
set PROGRAM_PATH="C:\Users\Administrator\Desktop\traffic-generator.exe"
set PROGRAM_OPTIONS=vensim C:\Users\Administrator\Desktop\traffic.csv

tasklist /FI "IMAGENAME eq %PROGRAM_NAME%" 2>NUL | find /I "%PROGRAM_NAME%" >NUL
if errorlevel 1 (
    echo %PROGRAM_NAME% is not running. Starting it now with options...
    start "" %PROGRAM_PATH% %PROGRAM_OPTIONS%
) else (
    echo %PROGRAM_NAME% is running.
)

rem cmd to run the script every 10 minutes
rem schtasks /create /tn "Program Monitor Script" /tr "cmd.exe /c /start /min C:\Users\Administrator\Desktop\tg-check.bat" /sc minute /mo 5
