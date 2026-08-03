@echo off
rem AudioMass launcher - double-click to start the editor.
rem Starts the local server (if not already running) and opens the app
rem in your default browser. Close the minimized "AudioMass Server"
rem window to stop the server.

cd /d "%~dp0src"

rem start the server only if nothing is listening on port 5055 yet
netstat -ano | findstr ":5055 " | findstr "LISTENING" >nul
if errorlevel 1 (
    where python >nul 2>nul
    if errorlevel 1 (
        start "AudioMass Server" /min py audiomass-server.py
    ) else (
        start "AudioMass Server" /min python audiomass-server.py
    )
    rem give the server a moment to bind before opening the browser
    ping -n 2 127.0.0.1 >nul
)

start "" "http://localhost:5055/"
