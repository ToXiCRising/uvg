#!/usr/bin/env bash

# ----------
# Basic init
# ----------
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
export UVG_FLAIR=""

# -------------------
# Loading config file
# -------------------
CONFIG_FILE=~/.config/uvg/uvg.config
if [[ -f "${CONFIG_FILE}" ]]; then
    #echo "${CONFIG_FILE} exists."
	source ${CONFIG_FILE}
else
	#echo "[UVG] Using base config"
	source ${SCRIPT_DIR}/uvg_base.config
fi

uvg(){
	if [[ $1 == "activate" ]]; then
		export ENV_DIR=${UVG_ENVRIONMENTS}/$2
		
		echo Set env to $ENV_DIR
		#export UVG_FLAIR=
		uvg_update_flair "[$2]"

	elif [[ $1 == "deactivate" ]]; then
		export ENV_DIR=""
		export UVG_FLAIR=""
		uvg_update_flair

	elif [[ $1 == "list" ]]; then
		echo Available Environments:
		ls ${UVG_ENVRIONMENTS} | while read file; do echo -e "\t- ${file}"; done
		
	else
		#echo Running with $ENV_DIR
		UV_PROJECT=${ENV_DIR} uv $@
	fi
}

uvg_update_flair(){
	if [[ ${UVG_ADD_FLAIR} == 1 ]]; then
		export UVG_FLAIR=""
		export UVG_FLAIR=$1
	fi
}
