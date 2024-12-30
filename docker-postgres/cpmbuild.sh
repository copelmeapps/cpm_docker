#!/bin/bash
# read variables from .env file
set -o allexport
source .env
set +o allexport
PG_VERSION="${PG_VERSION_DEFAULT}"
while getopts ":v:r:" opt; do
  case $opt in
    v) PG_VERSION="$OPTARG"
    ;;
    r) DOCKER_RUN="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    ;;
  esac
done
CURRENT_PATH=$(pwd)
PATH_IMG="$CURRENT_PATH/${PG_VERSION}"
echo """--- Version to build: ${PG_VERSION}"""
echo """--- Path : ${PATH_IMG}"""

docker buildx build --rm --platform=linux/amd64 -t copelmeapps/postgresql:15.0.1 "${PATH_IMG}/."

if $DOCKER_RUN; then
  docker run -p  
else
  printf "===\nImage built successfully! To start container --> ./cpmrun.sh\n"  
fi