#!/bin/bash
# HatStudio launcher for macOS / Linux.
# Double-click this file (macOS) or run ./start.command to open the customizer.
cd "$(dirname "$0")" || exit 1
PORT=8080

# Pick whatever static server is available.
if command -v python3 >/dev/null 2>&1; then
  SERVER=(python3 -m http.server "$PORT")
elif command -v python >/dev/null 2>&1; then
  SERVER=(python -m http.server "$PORT")
elif command -v npx >/dev/null 2>&1; then
  SERVER=(npx --yes http-server -p "$PORT" -s)
else
  echo "HatStudio needs Python or Node installed to run."
  echo "Install Python from https://www.python.org/ then double-click this again."
  read -r -p "Press Enter to close..."
  exit 1
fi

URL="http://localhost:$PORT/"
echo "==============================================="
echo "  HatStudio is starting at: $URL"
echo "  Keep this window OPEN while using the app."
echo "  Close this window to stop the app."
echo "==============================================="

# Open the browser shortly after the server starts.
( sleep 1; (open "$URL" 2>/dev/null || xdg-open "$URL" 2>/dev/null) ) &

exec "${SERVER[@]}"
