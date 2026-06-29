@echo off
REM HatStudio launcher for Windows. Double-click this file to open the customizer.
cd /d "%~dp0"
set PORT=8080
set URL=http://localhost:%PORT%/

echo ===============================================
echo   HatStudio is starting at: %URL%
echo   Keep this window OPEN while using the app.
echo   Close this window to stop the app.
echo ===============================================

where python >nul 2>nul
if %errorlevel%==0 (
  start "" "%URL%"
  python -m http.server %PORT%
  goto :eof
)

where npx >nul 2>nul
if %errorlevel%==0 (
  start "" "%URL%"
  npx --yes http-server -p %PORT% -s
  goto :eof
)

echo HatStudio needs Python or Node installed to run.
echo Install Python from https://www.python.org/ then double-click this again.
pause
