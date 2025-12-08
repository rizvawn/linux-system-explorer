start_quiz() {

    declare -A QUESTIONS=(

    ["Q1"]="Which directory typically stores system logs?|a:/etc|b:/var|c:/usr|d:/opt|answer:b|explanation:/var contains variable data such as logs."
    ["Q2"]="Which directory holds system-wide configuration files?|a:/etc|b:/var|c:/home|d:/usr|answer:a|explanation:/etc is used for system configuration files."

    )

    for key in "${!QUESTIONS[@]}"; do
        printf '%s -> %s\n' "$key" "${QUESTIONS[$key]}"
    done
}

start_quiz "$@"