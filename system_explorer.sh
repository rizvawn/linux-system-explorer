#!/usr/bin/env bash

set -euo pipefail

readonly RED='\033[0;31m'
readonly GREEN='\033[0;32m'
readonly YELLOW='\033[1;33m'
readonly BLUE='\033[0;34m'
readonly NC='\033[0m' 

main() {
    echo -e "${GREEN}Welcome to Linux System Explorer!${NC}"
    echo "This tool will help you learn the Filesystem Hierarchy Standard."
}

main "$@"
