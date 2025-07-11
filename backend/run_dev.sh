#!/bin/bash

# Path to your virtual environment (adjust as needed)
VENV_DIR=".venv"

# Command to activate the virtual environment
ACTIVATE_SCRIPT="$VENV_DIR/bin/activate"

# Check if a virtual environment is active
if [[ -z "$VIRTUAL_ENV" ]]; then
  echo "ℹ️  Virtual environment not active. Attempting to activate '$VENV_DIR'..."

  if [[ -f "$ACTIVATE_SCRIPT" ]]; then
    # Activate the virtual environment
    source "$ACTIVATE_SCRIPT"
    echo "✅ Activated virtual environment: $(basename "$VIRTUAL_ENV")"
  else
    echo "❌ Could not find activate script at '$ACTIVATE_SCRIPT'"
    exit 1
  fi
else
  echo "✅ Virtual environment already active: $(basename "$VIRTUAL_ENV")"
fi

# Run the command
echo "🚀 Starting FastAPI dev server..."
uv run FastAPI dev
