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

        local function_explore_directory="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/function_explore_directory.sh"
        local function_start_quiz="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/function_start_quiz.sh"

        case $choice in
            1) source "$function_explore_directory" ;;
            2) source "$function_start_quiz" ;;
            3) echo "Goodbye!"; break ;;
            *) echo -e "${RED}invalid choice. Please select 1-3.${NC}" ;;
        esac
    done
}

main() {

    echo -e "${GREEN}Welcome to Linux System Explorer!${NC}"
    echo "This tool will help you learn the Filesystem Hierarchy Standard."

    menu
}

main "$@"
