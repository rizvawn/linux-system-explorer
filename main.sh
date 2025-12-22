#!/usr/bin/env bash
# Dynamic sourcing is intentional for portability - ShellCheck can't follow runtime paths
# shellcheck disable=SC1090

set -euo pipefail

export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[1;33m'
export BLUE='\033[0;34m'
export NC='\033[0m' 

export script_dir
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

function_explore_directory="$script_dir/function_explore_directory.sh"
function_start_quiz="$script_dir/function_start_quiz.sh"
function_cheat_sheet="$script_dir/function_cheat_sheet.sh"
help_file="$script_dir/help.txt"

menu() {

    echo -e "${GREEN}Welcome to Linux System Explorer!${NC}"
    echo "This tool will help you learn the Filesystem Hierarchy Standard."
        
    while true ; do
        echo -e "\n${BLUE}Main Menu:${NC}"
        echo "1. Explore a directory"
        echo "2. Take a quiz"
        echo "3. View cheat sheet"
        echo "4. Exit"
        read -r -p "Choose an option (1-4): " choice
        echo

        case $choice in
            1) source "$function_explore_directory" ;;
            2) source "$function_start_quiz" ;;
            3) source "$function_cheat_sheet";;
            4) echo "Goodbye!"; break ;;
            *) echo -e "${RED}invalid choice. Please select 1-4.${NC}" ;;
        esac
    done
}

main() {

    echo -e "\n${GREEN}Welcome to Linux System Explorer!\n${NC}"
    echo -e "This tool will help you learn the Filesystem Hierarchy Standard.\n"

    if [[ $# -gt 0 ]]; then

        case $1 in 
            --quiz|-q)
                source "$function_start_quiz" ;;
            --cheatsheet|-c)
                source "$function_cheat_sheet" ;;
            --explore|-e)
                if [[ -z "${2:-}" ]]; then
                    echo -e "${RED}Error: --explore requires a directory path${NC}"
                    echo "Example: ./main.sh --explore /etc"
                    echo "Run './main.sh --help' for more information."
                    exit 1
                fi
                source "$function_explore_directory" "$2" ;;
            --help|-h)
                cat "$help_file" ;;
            *)
                echo -e "${RED}Error: Unknown option '$1'${NC}"
                echo "Run './main.sh --help for more information."
                exit 1
                ;;
        esac
    else
        menu
    fi
}

main "$@"
