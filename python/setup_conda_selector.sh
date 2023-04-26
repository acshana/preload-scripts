#!/bin/bash

set -e

RED=$(tput setaf 1)
ORANGE=$(tput setaf 166)
GREEN=$(tput setaf 2)
RESET=$(tput sgr0)

ERROR() {
  echo "${RED}$(date +"%Y-%m-%d %H:%M:%S") [ERROR]: $*${RESET}"
}

WARN() {
  echo "${ORANGE}$(date +"%Y-%m-%d %H:%M:%S") [WARN]: $*${RESET}"
}

INFO() {
  echo "${GREEN}$(date +"%Y-%m-%d %H:%M:%S") [INFO]: $*${RESET}"
}

# Install fzf if not installed
if ! command -v fzf > /dev/null 2>&1; then
    INFO "fzf is not installed. Installing fzf now ..."
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install --all --no-bash --no-fish
fi

# Check if fzf command is installed
if ! command -v fzf > /dev/null 2>&1; then
    ERROR "fzf is not installed. Please install fzf (https://github.com/junegunn/fzf) before running this script." 
    exit 1
fi

INFO "fzf is installed."

# Update .bashrc
curl -sSL https://raw.githubusercontent.com/acshana/preload-scripts/main/python/setup_conda_selector.sh >> ~/.bashrc
source ~/.bashrc