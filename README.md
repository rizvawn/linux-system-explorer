# Linux System Explorer

An interactive Bash script for learning the Linux Filesystem Hierarchy Standard (FHS) through hands-on exploration.

## About This Project

This project is focused on building practical system administration skills. It serves as a foundational learning tool for understanding how Linux organizes its filesystem.

### What is the Filesystem Hierarchy Standard (FHS)?

The FHS defines the directory structure and directory contents in Unix-like operating systems. Understanding where things are located, and *why*, is essential for:

- Troubleshooting system issues
- Configuring services and applications
- Managing logs and temporary files
- Understanding package management
- Working with containers and virtual machines

## Project Status

🚧 **Currently in development**

## Prerequisites

- Linux system (Ubuntu 22.04/24.04 recommended)
- Bash 4.0 or higher
- Basic command-line familiarity

## Learning Goals

By working through this project, I'm learning to:

- Understand the purpose of major Linux directories (`/etc`, `/var`, `/home`, `/usr`, etc.)
- Learn essential file inspection commands (`ls`, `du`, `file`, `stat`)
- Practice reading system information safely (read-only operations)
- Build familiarity with virtual filesystems (`/proc`, `/sys`)

## Related Concepts

- **FHS**: [Filesystem Hierarchy Standard documentation](https://refspecs.linuxfoundation.org/FHS_3.0/fhs/index.html)
- **man pages**: `man hier` provides a description of the filesystem hierarchy
