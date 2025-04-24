#!/bin/bash
set -e

echo "Start bootstrap setup"

# Prevent running as root
if [ "$EUID" -eq 0 ]; then
  echo "Please run this script as a regular user, not as root."
  exit 1
fi

# Ask for sudo and keep it alive in background
sudo -v
while true; do
  sudo -n true
  sleep 60
done 2>/dev/null &
SUDO_KEEP_ALIVE_PID=$!
trap 'kill "$SUDO_KEEP_ALIVE_PID"' EXIT

# Xcode CLT
if ! xcode-select -p &>/dev/null; then
  echo "Installing Xcode Command Line Tools..."
  xcode-select --install
  echo "Please run 'chezmoi apply' again after installation completes."
  exit 1
else
  echo "Xcode Command Line Tools already installed. Skipping."
fi

# Homebrew
if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew..."
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
  echo "Homebrew already installed. Skipping."
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

echo "Bootstrap setup complete."
