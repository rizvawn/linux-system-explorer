show_cheatsheet() {

   declare readonly DIRECTORIES=(
        "/etc:System configuration files"
        "/var:Variable data (logs, caches, spools)"
        "/proc:Process and kernel info (virtual)"
        "/bin:Essential command binaries"
        "/sbin:Essential system binaries"
        "/lib:Essential shared libraries"
        "/usr:User applications and data"
        "/home:User home directories"
        "/root:Root user's home directory"
        "/tmp:Temporary files"
        "/boot:Boot loader files"
        "/dev:Device files"
        "/opt:Optional application software"
        "/mnt:Mount point for removable media"
        "/srv:Service data"
    )

    local path=""
    local description=""

    for entry in "${DIRECTORIES[@]}"; do

        path="${entry%%:*}"
        description="${entry#*:}"

        printf "${YELLOW}Directory: ${BLUE}%-10s ${YELLOW}Description: ${BLUE}${description}\n${NC}" "$path"
    done

    echo
    read -s -p "Press Enter to return to the menu"
    echo

    if true; then return 0; fi

}

show_cheatsheet "$@"