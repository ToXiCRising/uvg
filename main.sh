#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

UVG_ADD_FLAIR=0
export UVG_FLAIR=""
UVG_ENVRIONMENTS=$SCRIPT_DIR/envs

uvg(){
	if [[ $1 == "activate" ]]; then
		export ENV_DIR=$UVG_ENVRIONMENTS/$2
		
		echo Set env to $ENV_DIR
		export UVG_FLAIR="[$2]"

	elif [[ $1 == "deactivate" ]]; then
		export ENV_DIR=""
		export UVG_FLAIR=""

	elif [[ $1 == "list" ]]; then
		echo Available Environments:
		ls $UVG_ENVRIONMENTS | while read file; do echo -e "\t- $file"; done
		
	else
		#echo Running with $ENV_DIR
		UV_PROJECT=$ENV_DIR uv $@
	fi
}

get_flair(){
	echo $UVG_FLAIR 2> /dev/null
}
