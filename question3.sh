#script code for question 3

#!/bin/bash

# Function to display usage
usage() {
    echo "Usage: $0 <service_name>"
    exit 1
}

# Check if the service name is provided
if [ $# -ne 1 ]; then
    usage
fi

SERVICE_NAME=$1

# Check if the service is running
if systemctl is-active --quiet "$SERVICE_NAME"; then
    echo "The service '$SERVICE_NAME' is running."
else
    echo "The service '$SERVICE_NAME' is not running."
fi

# Optionally, check if the service is enabled (to start on boot)
if systemctl is-enabled --quiet "$SERVICE_NAME"; then
    echo "The service '$SERVICE_NAME' is enabled."
else
    echo "The service '$SERVICE_NAME' is not enabled."
fi
