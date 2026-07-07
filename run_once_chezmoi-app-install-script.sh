#!/bin/bash

# This script updates the APT package list and installs applications
# using the APT package manager (assuming a Debian based OS).
# If a package is already installed it is skipped.
#
# Usage:
# 1. Make it executable: chmod +x chezmoi-app-install_script.sh
# 2. Run with root privileges: sudo ./chezmoi-app-install-script.sh

# "strict" bash mode. Exit on error. Exit on unused variable etc.
set -euo pipefail

script_name=$0
already_installed=""
packages_installed=""

# Define functions used in the "main" script at the bottom.

update_packages() {
    echo "Updating package list..."
    sudo apt-get update -y
}
install_package() {
    local package_name=$1
    # Note: dpkg-query -W = lists installed packages matching the given argument.
    # grep -w = match whole word.
    # Also: if statement without brackets checks exit code in contrast to standard if [ ], which uses 'test'
    if dpkg-query -W ${package_name} | grep -qw "${package_name}"; then
        echo "$package_name is already installed." && already_installed="${package_name} ${already_installed}"
    else
        echo "Installing ${package_name}..."
        sudo apt-get install ${package_name} -y && packages_installed="${package_name} ${packages_installed}"
    fi
}
main() {
  update_packages
  install_package "vim"
  install_package "git"
  echo "" # to get blank line.
  echo "Finished running ${script_name}"
  echo "Packages newly installed: ${packages_installed}"
  echo "Packages already installed: ${already_installed}" 
}

# Execute the main function
main

