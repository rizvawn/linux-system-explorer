#!/usr/bin/env bash

explore_directory() {

    local dir="${1:-}"

    if [[ -z "$dir" ]]; then
        read -r -p "Enter directory path to explore (e.g., /etc or etc): " dir
    fi  
    
    if [[ "$dir" != /* ]]; then
        dir="/$dir"
    fi

    if [[ ! -d "$dir" ]]; then
        echo -e "${RED}Error: '$dir' is not a directory.${NC}"
    return 0
    fi

    if [[ ! -r "$dir" ]]; then
        echo -e "${RED}Permission denied: Cannot read '$dir'${NC}"
        echo "Tip: Some directories require root access (sudo)"
    return 0
    fi

    echo -e "${GREEN}Exploring: $dir${NC}"
    echo -e "${YELLOW}Contents (ls -lah, first 10 lines):${NC}"
    find "$dir" -maxdepth 1 -ls | head -10 || true
    echo -e "\n${YELLOW}Total size (du -sh):${NC}"
    du -sh "$dir" 2>/dev/null || echo -e "${RED}Could not determine size${NC}"

    while true; do
        echo -e "\n${BLUE}Enter a filename to inspect (or press Enter to return to menu):${NC}"
        read -r item

        if [[ -z "$item" ]]; then
            return 0
        fi

        local full_path="${dir%/}/${item##*/}"  # % removes the given suffix, which in our case is '/', and ## removes the entire prefix

        if [[ ! -e "$full_path" ]]; then
            echo -e "${RED}Error: '$item' not found in $dir${NC}"
            continue
        fi

        if [[ -d "$full_path" ]]; then
            if explore_directory "$full_path"; then 
                return 0
            fi
        elif [[ -f "$full_path" ]]; then
            echo -e "${GREEN}File Type:${NC}"
            file_info=$(file "$full_path")
            echo "$file_info"

            echo -e "${GREEN}File Stats:${NC}"
            stat "$full_path"

            if [[ "$file_info" == *"text"* ]]; then
                echo -e "\n${YELLOW}Content Preview (head -n 20):${NC}"
                head -n 20 "$full_path"
            fi
        fi
    done
}

explore_directory "$@"