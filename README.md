# Linux System Explorer

![Tests](https://img.shields.io/badge/tests-passing-brightgreen)
![Bash](https://img.shields.io/badge/bash-4.0%2B-blue)

A production-ready educational CLI tool built with Bash that demonstrates proficiency in system programming, filesystem operations, and interactive application design. The tool provides comprehensive exploration of the Linux Filesystem Hierarchy Standard (FHS) through an intuitive interface combining directory navigation, knowledge assessment, and reference documentation.

## ✨ Features & Technical Highlights

### Core Capabilities

- **📂 Recursive Directory Explorer**
  - Full filesystem navigation including virtual filesystems (`/proc`, `/sys`)
  - Real-time file type detection and classification using system utilities
  - Comprehensive permission validation with informative error handling
  - Content preview for text files with automatic type detection

- **📝 Interactive Assessment System**
  - 13 scenario-based questions covering real-world filesystem challenges
  - State management tracking answered vs. unanswered questions
  - Immediate feedback mechanism with contextual explanations
  - Graceful exit handling and score persistence

- **📖 Integrated Reference Documentation**
  - Structured cheatsheet covering 15 essential FHS directories
  - Efficient data storage using colon-separated arrays
  - Color-coded categorical display for enhanced readability

- **🔍 Advanced File Inspection**
  - Multi-tool inspection pipeline (`file`, `stat`, `head`)
  - Intelligent content preview with 20-line windowing
  - Robust error handling for permission-denied scenarios
  - Support for regular files, symlinks, and special device files

- **⚡ Dual Interface Architecture**
  - Interactive menu-driven mode for guided exploration
  - CLI argument parsing with GNU-style long/short flags (`--quiz`/`-q`)
  - Direct function invocation bypassing menu system
  - Comprehensive help system with usage examples

- **🔒 Security-First Design**
  - Strict read-only operations with no filesystem modifications
  - Input validation preventing path traversal and injection attacks
  - No use of `eval` or arbitrary code execution
  - Defensive error handling with `set -euo pipefail`

## 🚀 Quick Start

### Installation

1. Clone or download this repository:

   ```bash
   git clone https://github.com/rizvawn/linux-system-explorer
   cd linux-system-explorer
   ```

2. Make the script executable:

   ```bash
   chmod +x main.sh
   ```

3. Run interactively:

   ```bash
   ./main.sh
   ```

### Usage Examples

### Interactive Menu (default)

```bash
./main.sh
```

### Jump to Quiz

```bash
./main.sh --quiz
# or shorthand:
./main.sh -q
```

### Show FHS Cheatsheet

```bash
./main.sh --cheatsheet
# or shorthand:
./main.sh -c
```

### Explore a Directory Directly

```bash
./main.sh --explore /var/log
# or shorthand:
./main.sh -e /var/log
```

## Technical Domain Coverage

### Filesystem Hierarchy Standard (FHS)

This project demonstrates comprehensive understanding of Unix filesystem organization principles, essential for:

- System diagnostics and troubleshooting workflows
- Service configuration and management
- Storage analysis and capacity planning
- Container image optimization and VM provisioning

### Filesystem Components Analyzed

The tool provides detailed exploration of 15 critical directories across the FHS specification:

- **`/etc`** — System-wide configuration files and scripts
- **`/var`** — Variable runtime data (logs, caches, spools, temporary databases)
- **`/home`** — User-specific data directories
- **`/proc`** — Virtual filesystem exposing kernel and process information
- **`/sys`** — Virtual filesystem for kernel device and driver information
- **`/usr`** — Read-only user application binaries and data
- **`/tmp`** — Temporary files with automatic cleanup on reboot
- **`/boot`** — Bootloader and kernel image storage
- **`/dev`** — Device file interfaces (block and character devices)
- **`/opt`** — Optional third-party software packages
- Plus 5 additional essential paths (`/bin`, `/sbin`, `/lib`, `/root`, `/mnt`)

## Architecture & Project Structure

```text

linux-system-explorer/
├── main.sh                          # Application entry point with CLI argument router
├── function_explore_directory.sh    # Recursive navigation and file analysis engine
├── function_start_quiz.sh           # Assessment system with state management
├── function_cheat_sheet.sh          # Reference documentation renderer
├── help.txt                         # User documentation and usage patterns
├── tests/
│   └── test_explorer.bats          # Automated test suite (100% passing)
└── README.md                        # Technical documentation (this file)

```

### Design Patterns & Implementation

- **Modular Architecture**: Function-based decomposition with single-responsibility principle
- **Dynamic Sourcing**: Runtime function loading using `${BASH_SOURCE[0]}` for directory-agnostic execution
- **Data Structures**: Leverages Bash 4.0+ associative arrays for O(1) question lookup and indexed arrays for directory metadata
- **Global State Management**: Color constants defined at application scope and inherited by sourced modules
- **Error Propagation**: Consistent return code semantics with defensive error handling throughout call stack

### Architecture Notes

- **Modular Design**: Functions are separated into individual files for maintainability
- **Source-Based Loading**: `main.sh` sources function files dynamically using `${BASH_SOURCE[0]}`
- **Data Structures**: Uses Bash associative arrays for quiz questions and indexed arrays for directories
- **Color Constants**: Defined once in `main.sh` and available to all sourced functions

## 🧪 Testing

This project includes automated tests using [BATS (Bash Automated Testing System)](https://github.com/bats-core/bats-core).

**Install BATS** (Fedora):

```bash
sudo dnf install bats
```

**Run Tests**:

```bash
bats tests/test_explorer.bats
```

**Current Test Coverage** (3 tests passing):

- ✅ Script executable check
- ✅ Help flag validation
- ✅ Error handling for invalid arguments

## Skills Demonstrated

This project showcases proficiency in:

- **Linux System Architecture** — Deep understanding of FHS organization and filesystem semantics
- **Bash Scripting Excellence** — Advanced shell programming with associative arrays, parameter expansion, and modular design
- **Secure Coding Practices** — Input validation, error handling, and read-only operation constraints
- **CLI Application Design** — Menu-driven interfaces, argument parsing, and user experience optimization
- **Software Testing** — Automated test coverage using BATS framework with continuous validation
- **Technical Documentation** — Comprehensive README and structured help systems
- **Shell**: Bash 4.0 or higher (required for associative arrays)
- **Commands**: Standard GNU coreutils (`ls`, `du`, `file`, `stat`, `head`)
- **Skills**: Basic command-line familiarity
- **Optional**:
  - BATS for running tests
  - `tree` command for visual directory display
  - `shellcheck` for linting

## 🔗 Related Resources

- **FHS Specification**: [Filesystem Hierarchy Standard v3.0](https://refspecs.linuxfoundation.org/FHS_3.0/fhs/index.html)
- **Man Pages**: Run `man hier` for filesystem hierarchy description
- **Linux Journey**: [filesystems tutorial](https://linuxjourney.com/lesson/filesystem-hierarchy)
- **Bash Reference**: [GNU Bash Manual](https://www.gnu.org/software/bash/manual/bash.html)
