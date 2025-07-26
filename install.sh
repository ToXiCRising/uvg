#!/usr/bin/env bash
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
yes_or_no "Install uv-global?" && printf '%s' "
# >>> uv-global initalize >>> 
source ${SCRIPT_DIR}/main.sh 
export PS1='\$(echo -n "\$UVG_FLAIR")'\"\$PS1\"
# <<< uv-global initalize <<<
" >> ~/.bashrc