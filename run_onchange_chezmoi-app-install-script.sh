#!/bin/bash

# This script updates the APT package list and installs applications
# using the APT package manager (it assumes a Debian based OS).
# If a package is already installed it is skipped. 
# Chezmoi runs files named run_onchance_*.sh everytime the file is changed.

# "strict" bash mode. Exit on error. Exit on unused variable etc.
set -euo pipefail

script_name=$0
already_installed=""
packages_installed=""

# APT packages that should be installed on all systems.
packages=(
  "vim"
  "git"
  "openjdk-21-jdk"
  "copyq"
)

# Define functions used in the "main" script at the bottom.

update_packages() {
    echo "Updating package list..."
    sudo apt-get update
}
install_package() {
    local package_name=$1
    # Note: dpkg-query -W = lists installed packages matching the given argument.
    # dpkg-query --showformat='${db:Status-Status}' makes dpkg-query output only the status of the package (e.g. 'installed' or 'not installed')
    # grep -q = quiet (no output to standard output)
    # grep "^" and "$" = regex. Start of line and end of line respectively. 
    # Also: if statement without brackets checks exit code in contrast to standard if with [ ], which uses 'test'
    if dpkg-query -W --showformat='${db:Status-Status}' "${package_name}" | grep --quiet "^installed$"; then
        echo "[SKIP] $package_name is already installed." && already_installed="${package_name} ${already_installed}"
    else
        echo "[INSTALL] Installing ${package_name}..."
        sudo apt-get install "${package_name}" -y && packages_installed="${package_name} ${packages_installed}"
    fi
}
main() {
  update_packages
  for package in "${packages[@]}"; do
    install_package "$package"
  done
  echo "" # to get blank line.
  echo "Finished running ${script_name}"
  echo "Packages newly installed: ${packages_installed}"
  echo "Packages already installed: ${already_installed}" 
}

# Execute the main function
main

