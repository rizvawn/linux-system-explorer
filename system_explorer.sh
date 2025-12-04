#!/usr/bin/env bash

set -euo pipefail

readonly RED='\033[0;31m'
readonly GREEN='\033[0;32m'
readonly YELLOW='\033[1;33m'
readonly BLUE='\033[0;34m'
readonly NC='\033[0m' 

menu() {

    while [[ true ]]; do
        echo -e "\n${BLUE}Main Menu:${NC}"
        echo "1. Explore a directory"
        echo "2. Take a quiz"
        echo "3. Exit"
        read -p "Choose an option (1-3): " choice

        case $choice in
            1) explore_directory ;;
            2) echo "Quiz not implemented yet." ;;
            3) echo "Goodbye!"; break ;;
            *) echo -e "${RED}invalid choice. Please select 1-3.${NC}" ;;
        esac
    done
}

explore_directory() {

    read -p "Enter directory path to explore (e.g., /etc or etc): " dir
    
    if [[ "$dir" != /* ]]; then
        dir="/$dir"
    fi

    if [[ ! -d "$dir" ]]; then
        echo -e "${RED}Error: '$dir' is not a directory.${NC}"
    return 1
    fi

    if [[ ! -r "$dir" ]]; then
        echo -e "${RED}Permission denied: Cannot read '$dir'${NC}"
        echo "Tip: Some directories require root access (sudo)"
    return 1
    fi

    echo -e "${GREEN}Exploring: $dir${NC}"
    echo -e "${YELLOW}Contents (ls -lah, first 10 lines):${NC}"
    ls -lah "$dir" | head -10 || true
    echo -e "\n${YELLOW}Total size (du -sh):${NC}"
    du -sh "$dir" 2>/dev/null || echo -e "${RED}Could not determine size${NC}"
}

main() {

    echo -e "${GREEN}Welcome to Linux System Explorer!${NC}"
    echo "This tool will help you learn the Filesystem Hierarchy Standard."

    menu
}

main "$@"
