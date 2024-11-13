#!/bin/bash
set -euo pipefail

# ==============================================================================
# Title:          Model Pull Script
# Description:    Pulls all available models listed by `ollama ls`, handling any
#                 errors encountered during the process and skipping failed pulls.
# Author:         elvee
# Version:        0.1.0
# License:        MIT
# Creation Date:  13-11-2024
# Last Modified:  13-11-2024
# Usage:          ./ollama-pull-all.sh
# ==============================================================================

# ASCII Art Banner Function
print_ascii_art() {
    echo """
       ____ _    _    ____ _  _ ____
       |  | |    |    |__| |\/| |__|
       |__| |___ |___ |  | |  | |  |

    ___  _  _ _    _       ____ _    _
    |__] |  | |    |    __ |__| |    |
    |    |__| |___ |___    |  | |___ |___

       _  _ ____ ___  ____ _    ____
       |\/| |  | |  \ |___ |    [__
       |  | |__| |__/ |___ |___ ___]
    """
}

# Help Function
show_help() {
    echo "
Usage: $0 [OPTIONS]

Options:
  -h, --help          Display this help message and exit.
  
Description:
  This script pulls all models available via 'ollama ls' command.
  If any model fails to pull, an error message is displayed, and the process
  continues with the next model.
"
}

# Parse Command-Line Arguments
while [[ $# -gt 0 ]]; do
    case "$1" in
        -h|--help)
            show_help
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            show_help
            exit 1
            ;;
    esac
    shift
done

# Model Pulling Function
pull_models() {
    echo "Pulling models..."
    models=$(ollama ls | grep -v "NAME" | awk '{print $1}')
    
    for model in $models; do
        echo "Pulling $model..."
        
        # Attempt to pull the model and handle any errors
        if ! ollama pull "$model"; then
            echo "Error pulling $model"
            echo "Skipping..."
        fi
    done
    
    echo "All models pulled successfully."
}

# Main Execution
print_ascii_art
pull_models
