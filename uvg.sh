#!/bin/bash

#ENV_DIR="/home/kathy/Documents/dev/uv_test/hello"
UVG_ADD_FLAIR=0

uvg(){
	if [[ $1 == "activate" ]]; then
		export ENV_DIR=$2
		echo Set env to $2
	elif [[ $1 == "deactivate" ]]; then
		export ENV_DIR=""	
	else
		echo Running with $ENV_DIR
		UV_PROJECT=$ENV_DIR uv $@
	fi
}
