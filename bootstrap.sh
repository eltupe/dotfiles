#!/bin/bash

# Function to check if Homebrew is installed
check_homebrew() {
  if command -v brew &> /dev/null; then
    echo "Homebrew is already installed."
    return 0
  else
    echo "Homebrew is not installed."
    return 1
  fi
}

# Function to install Homebrew
install_homebrew() {
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  
  if [ $? -eq 0 ]; then
    echo "Homebrew installed successfully."
  else
    echo "Failed to install Homebrew."
    exit 1
  fi
}

# Function to check and install a cask application using Homebrew
install_cask_app() {
  local app_name=$1
  if brew list --cask "$app_name" &> /dev/null; then
    echo "$app_name is already installed."
  else
    echo "Installing $app_name..."
    brew install --cask "$app_name"
    
    if [ $? -eq 0 ]; then
      echo "$app_name installed successfully."
    else
      echo "Failed to install $app_name."
      exit 1
    fi
  fi
}

# Function to check and install a formula using Homebrew
install_formula() {
  local formula_name=$1
  if brew list "$formula_name" &> /dev/null; then
    echo "$formula_name is already installed."
  else
    echo "Installing $formula_name..."
    brew install "$formula_name"
    
    if [ $? -eq 0 ]; then
      echo "$formula_name installed successfully."
    else
      echo "Failed to install $formula_name."
      exit 1
    fi
  fi
}

# Main logic
check_homebrew
if [ $? -eq 1 ]; then
  install_homebrew
fi

# List of cask applications to install
cask_apps=(
  1password
  microsoft-teams
  threema
  whatsapp
  postman
  zoom
  brave-browser
  visual-studio-code
  tableplus
  wezterm
)

# List of formulae to install
formulae=(
  ansible
  go
  golang-migrate
  terraform
  git-flow
  postgresql@14
)

# Install each cask application
for app in "${cask_apps[@]}"; do
  install_cask_app "$app"
done

# Install each formula
for formula in "${formulae[@]}"; do
  install_formula "$formula"
done
