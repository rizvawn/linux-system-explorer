#!/bin/bash
set -euo pipefail

readonly RED='\033[0;31m'
readonly GREEN='\033[0;32m'
readonly YELLOW='\033[1;33m'
readonly BLUE='\033[0;34m'
readonly NC='\033[0m'

show_menu() {
    clear
    echo -e "${BLUE}╔════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║${NC}   ${YELLOW}Linux System Explorer${NC}            ${BLUE}║${NC}"
    echo -e "${BLUE}╚════════════════════════════════════════╝${NC}"
    echo ""
    echo "1) Explore Directory"
    echo "2) Take Quiz"
    echo "3) View FHS Cheatsheet"
    echo "4) Exit"
    echo ""
}

main() {
    while true; do
        show_menu
        read -rp "Choose an option (1-4): " choice
        
        case "$choice" in
            1)
                echo -e "\n${GREEN}Directory exploration coming soon...${NC}"
                read -rp "Press Enter to continue"
                ;;
            2)
                echo -e "\n${GREEN}Quiz feature coming soon...${NC}"
                read -rp "Press Enter to continue"
                ;;
            3)
                echo -e "\n${GREEN}Cheatsheet coming soon...${NC}"
                read -rp "Press Enter to continue"
                ;;
            4)
                echo -e "\n${YELLOW}Thanks for exploring! Goodbye.${NC}"
                exit 0
                ;;
            *)
                echo -e "\n${RED}Invalid option. Please choose 1-4.${NC}"
                read -rp "Press Enter to continue"
                ;;
        esac
    done
}

main