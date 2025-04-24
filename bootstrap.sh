#!/bin/bash
set -e

REPO_USER="eltupe"

# Step 1: Ensure Xcode CLT is installed
if ! xcode-select -p &>/dev/null; then
  echo "Xcode Command Line Tools not found. Installing..."
  xcode-select --install

  echo "Waiting for Xcode Command Line Tools to finish installing..."
  until xcode-select -p &>/dev/null; do
    sleep 5
  done

  echo "Xcode Command Line Tools installed."
fi

# Step 2: Run the official chezmoi install command
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply "$REPO_USER"
