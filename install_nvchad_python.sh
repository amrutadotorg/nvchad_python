#!/bin/bash

# Exit on any error
set -e

# Configuration
REPO_URL="https://github.com/amrutadotorg/nvchad_python"
NVIM_CONFIG_DIR="$HOME/.config/nvim"
TEMP_DIR="/tmp/nvchad_python_setup"

# Print colored status messages
print_status() {
    echo -e "\033[1;34m==> $1\033[0m"
}

# Check if necessary directories exist
check_directories() {
    if [ ! -d "$NVIM_CONFIG_DIR" ]; then
        print_status "Error: NeoVim config directory not found at $NVIM_CONFIG_DIR"
        print_status "Please install NvChad first"
        exit 1
    fi
}

# Clean up temporary directory if it exists
cleanup() {
    if [ -d "$TEMP_DIR" ]; then
        print_status "Cleaning up temporary files..."
        rm -rf "$TEMP_DIR"
    fi
}

# Main installation function
install_config() {
    # Create temporary directory
    mkdir -p "$TEMP_DIR"
    cd "$TEMP_DIR"

    print_status "Cloning repository..."
    git clone "$REPO_URL" .

    print_status "Copying configuration files..."
    # Copy main configuration files
    cp mappings.lua options.lua "$NVIM_CONFIG_DIR/lua/"

    # Copy config directories
    cp -r configs/* "$NVIM_CONFIG_DIR/lua/configs/"
    cp -r plugins/* "$NVIM_CONFIG_DIR/lua/plugins/"

    print_status "Configuration files installed successfully!"
}

# Main execution
main() {
    # Set up cleanup on script exit
    trap cleanup EXIT

    check_directories
    install_config
}

# Run the script
main
