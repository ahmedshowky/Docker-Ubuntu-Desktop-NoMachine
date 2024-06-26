
#!/bin/bash

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to install Deluge
install_deluge() {
    echo "Installing Deluge..."
    
    if command_exists apt-get; then
        sudo apt-get update
        sudo apt-get install -y deluge
    elif command_exists yum; then
        sudo yum install -y epel-release
        sudo yum install -y deluge
    elif command_exists dnf; then
        sudo dnf install -y epel-release
        sudo dnf install -y deluge
    elif command_exists zypper; then
        sudo zypper install -y deluge
    else
        echo "Unsupported package manager. Please install Deluge manually."
        exit 1
    fi

    echo "Deluge installation completed."
}

# Function to install 7z
install_7z() {
    echo "Installing 7z..."
    
    if command_exists apt-get; then
        sudo apt-get update
        sudo apt-get install -y p7zip-full
    elif command_exists yum; then
        sudo yum install -y epel-release
        sudo yum install -y p7zip
    elif command_exists dnf; then
        sudo dnf install -y epel-release
        sudo dnf install -y p7zip
    elif command_exists zypper; then
        sudo zypper install -y p7zip
    else
        echo "Unsupported package manager. Please install 7z manually."
        exit 1
    fi

    echo "7z installation completed."
}

# Main script execution
echo "Starting installation of Deluge and 7z..."

install_deluge
install_7z

echo "Installation of Deluge and 7z completed."
