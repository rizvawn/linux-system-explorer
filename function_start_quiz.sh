start_quiz() {

    declare -A QUESTIONS=(
        ["Q1"]="Your web server keeps crashing. Where should you look for error logs?|a) /etc/logs|b) /var/log|c) /usr/logs|d) /tmp/logs|answer:b|explanation:/var/log stores system and application logs. Remember: /var = VARiable data that grows over time."
        ["Q2"]="You need to change your system's hostname permanently. Which file should you edit?|a) /home/hostname|b) /etc/hostname|c) /var/hostname|d) /usr/hostname|answer:b|explanation:/etc holds system-wide configuration files. Think ETC = Everything To Configure."
        ["Q3"]="A user 'alice' saves a document. Where does it go by default?|a) /usr/alice|b) /var/alice|c) /home/alice|d) /root/alice|answer:c|explanation:/home contains personal directories for regular users. Each user gets their own space under /home/username."
        ["Q4"]="You install Firefox using your package manager. Where do its binaries end up?|a) /bin|b) /usr/bin|c) /opt/bin|d) /home/bin|answer:b|explanation:/usr/bin stores user commands and applications. /bin is for essential system binaries; /usr/bin is for additional programs."
        ["Q5"]="A script creates temporary files that should survive reboots. Where should it write them?|a) /tmp|b) /var/tmp|c) /home/tmp|d) /usr/tmp|answer:b|explanation:/var/tmp persists across reboots, while /tmp is often cleared. Both store temporary files but with different lifetimes."
        ["Q6"]="You want to see which processes are currently using the CPU. Which virtual filesystem provides this info?|a) /sys|b) /dev|c) /proc|d) /var|answer:c|explanation:/proc is a virtual filesystem exposing kernel and process info. Try 'cat /proc/cpuinfo' to see CPU details!"
        ["Q7"]="Your system won't boot. The bootloader files are corrupted. Where are they located?|a) /boot|b) /root|c) /bin|d) /etc/boot|answer:a|explanation:/boot contains files needed for system startup, including the kernel and bootloader (GRUB)."
        ["Q8"]="You need to access your external USB drive. Where are device files located?|a) /devices|b) /dev|c) /var/dev|d) /sys/dev|answer:b|explanation:/dev contains device files (block and character devices). Your USB might appear as /dev/sdb."
        ["Q9"]="You download a proprietary app (Slack) that isn't in your distro's repos. Where should it install?|a) /usr|b) /bin|c) /opt|d) /etc|answer:c|explanation:/opt is for optional/add-on software packages that aren't part of the standard distribution."
        ["Q10"]="Only root should access SSH server keys. Where are they typically stored?|a) /root/.ssh|b) /home/ssh|c) /etc/ssh|d) /var/ssh|answer:c|explanation:/etc/ssh stores system-wide SSH config and host keys. User keys go in ~/.ssh (under /home)."
        ["Q11"]="You run a command without specifying its path. Where does the shell look first?|a) /usr/bin|b) /bin|c) /sbin|d) /opt/bin|answer:b|explanation:/bin contains essential user commands available in single-user mode. It's early in your $PATH for reliability."
        ["Q12"]="You need to run 'fsck' to repair a filesystem. This system admin tool is in:|a) /bin|b) /usr/bin|c) /sbin|d) /usr/sbin|answer:c|explanation:/sbin = System BINaries for root/admin tasks. Regular users' commands go in /bin; admin tools go in /sbin."
        ["Q13"]="A program needs a shared library 'libc.so'. Where is it located?|a) /usr/lib|b) /bin/lib|c) /lib or /lib64|d) /var/lib|answer:c|explanation:/lib (or /lib64) contains essential shared libraries needed by /bin and /sbin programs."
    )

    local score=0
    local correct_answer=""
    local explanation=""

    declare -A answered_correctly=()

    mapfile -t sorted_keys < <(printf '%s\n' "${!QUESTIONS[@]}" | sort -V)

    while (( $score < "${#QUESTIONS[@]}" )); do

        for key in "${sorted_keys[@]}"; do

            if [[ -n "${answered_correctly[$key]:-}" ]]; then
                continue
            fi

            local value="${QUESTIONS[$key]}"

            IFS='|' read -r -a parts <<< "$value"

            printf '\n\n%s -> %s\n\n' "$key" "${parts[0]}"

            for ((i=1; i<=4; i++)); do
                printf '%s\n' "${parts[i]}"
            done

            for part in "${parts[@]}"; do
                if [[ "$part" == answer:* ]]; then
                    correct_answer="${part#answer:}"
                fi
                if [[ "$part" == explanation:* ]]; then
                    explanation="${part#explanation:}"
                fi
            done

            while true; do
                echo
                read -p "Your answer (a/b/c/d) or press Enter to exit: " user_answer

                if [[ -z "$user_answer" ]]; then return 0; fi

                case "$user_answer" in
                    a|b|c|d)
                        break
                        ;;
                    *)
                        echo -e "${RED}Error: Your answer isn't a valid option.${NC}"
                        ;;
                esac
            done

            if [[ "$user_answer" == "$correct_answer" ]]; then
                ((score += 1))
                answered_correctly["$key"]=1
                echo -e "${GREEN}✓ Correct! Your score is ${score}/${#QUESTIONS[@]}.${NC}"
            else    
                echo -e "${RED}✗ Wrong. The correct answer is: $correct_answer${NC}"
            fi

            echo -e "${YELLOW}Explanation: $explanation${NC}"
        done

    done

    echo -e "\n${GREEN}Congratulations! You have successfully completed the quiz.${NC}\n"
    read -s -p "Press any key to return to the menu."
    echo
}

start_quiz "$@"