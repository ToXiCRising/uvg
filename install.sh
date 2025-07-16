#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

function yes_or_no {
    while true; do
        read -p "$* [y/n]: " yn
        case $yn in
            [Yy]*) return 0  ;;  
            [Nn]*) echo "Aborted" ; return  1 ;;
        esac
    done
}

# Appends a source to .bashrc
yes_or_no "Install uvg?" && echo "# --- Initializes uv-global --- " && echo "source $SCRIPT_DIR" #>> ~/.bashrc