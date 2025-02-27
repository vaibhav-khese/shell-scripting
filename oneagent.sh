#!/bin/bash

# Variables
DT_ENVIRONMENT_ID="<https://drf98551.live.dynatrace.com/>"
DT_API_TOKEN="<dt0c01.RR2JBRLFDRSPEJBQIIEKQ65G.Z5TM7HRILLGZDPI4AZZLNL2SEMTIVYH4HQRDF5DQARE5J3Q4HMTFQZUBMRMC2BTW>"
DT_DOWNLOAD_URL="https://{https://drf98551.live.dynatrace.com/}.live.dynatrace.com/api/v1/deployment/installer/agent/unix/latest"
DT_INSTALLER_PATH="/tmp/dynatrace-oneagent.sh"

# Function to download the Dynatrace OneAgent installer
download_oneagent() {
    echo "Downloading Dynatrace OneAgent..."
    curl -o "$DT_INSTALLER_PATH" -L -H "Authorization: Api-Token $DT_API_TOKEN" "$DT_DOWNLOAD_URL"
    if [ $? -ne 0 ]; then
        echo "Error: Failed to download Dynatrace OneAgent."
        exit 1
    fi
}

# Function to install Dynatrace OneAgent
install_oneagent() {
    echo "Installing Dynatrace OneAgent..."
    chmod +x "$DT_INSTALLER_PATH"
    sudo "$DT_INSTALLER_PATH" --set-app-log-content-access=true
    if [ $? -ne 0 ]; then
        echo "Error: Failed to install Dynatrace OneAgent."
        exit 1
    fi
}

# Main script execution
download_oneagent
install_oneagent

echo "Dynatrace OneAgent installation completed."