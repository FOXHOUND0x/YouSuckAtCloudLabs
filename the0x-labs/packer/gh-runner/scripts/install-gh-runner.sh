#!/bin/bash

set -euo pipefail

# Variables
GITHUB_RUNNER_VERSION="2.303.0"

# Update and install necessary packages
sudo yum update -y
sudo yum install -y wget git

# Create a user for the GitHub runner
sudo useradd -m -d /home/githubrunner -s /bin/bash githubrunner

# Switch to the Runner user
sudo su - githubrunner -c "bash -s" <<EOF
# Variables
RUNNER_DIR="/home/githubrunner/actions-runner"
TOKEN="${GITHUB_TOKEN}"
OWNER="${GITHUB_OWNER}"
REPO="${GITHUB_REPO}"

# Download and install the GitHub runner
mkdir \$RUNNER_DIR
cd \$RUNNER_DIR
curl -o actions-runner-linux-x64-${GITHUB_RUNNER_VERSION}.tar.gz -L "https://github.com/actions/runner/releases/download/v${GITHUB_RUNNER_VERSION}/actions-runner-linux-x64-${GITHUB_RUNNER_VERSION}.tar.gz"
tar xzf ./actions-runner-linux-x64-${GITHUB_RUNNER_VERSION}.tar.gz
rm -f actions-runner-linux-x64-${GITHUB_RUNNER_VERSION}.tar.gz

# Install dependencies
./bin/installdependencies.sh

# Configure the runner
./config.sh --unattended --url https://github.com/\$OWNER/\$REPO --token \$TOKEN

# Unattended service
sudo ./svc.sh install
sudo ./svc.sh start
EOF

echo "GitHub Actions Runner installation and configuration complete."