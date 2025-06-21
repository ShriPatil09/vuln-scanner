#!/bin/bash

# Set terminal colors
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
BLUE=$(tput setaf 4)
RESET=$(tput sgr0)

# Banner
echo "${BLUE}=========================================="
echo "   AUTOMATED VULNERABILITY SCANNER"
echo "==========================================${RESET}"

# Ask for input
read -p "Enter IP or domain to scan: " target

# Check if input is empty
if [ -z "$target" ]; then
    echo "${RED}No input provided. Exiting...${RESET}"
    exit 1
fi

echo ""
echo "${GREEN}[1] Scanning open ports with Nmap...${RESET}"
nmap -sV $target

echo ""
echo "${GREEN}[2] Detecting technologies with WhatWeb...${RESET}"
whatweb $target

echo ""
echo "${GREEN}[3] Performing WHOIS lookup...${RESET}"
whois $target

echo ""
echo "${GREEN}[4] Running Nikto vulnerability scan...${RESET}"
nikto -h $target

echo ""
echo "${BLUE}========== SCAN COMPLETED ==========${RESET}"
