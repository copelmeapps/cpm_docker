# read variables from .env file
set -o allexport
source .env
set +o allexport

# POSTGRESQL_MAX_WAL_SIZE="${POSTGRESQL_MAX_WAL_SIZE:-"${POSTGRES_MAX_WAL_SIZE:-}"}"
PG_VERSION="${PG_VERSION:-"${PG_VERSION_DEFAULT}"}"

CURRENT_PATH=$(pwd)
PATH_IMG="${PATH_IMG:-"${CURRENT_PATH}/${PG_VERSION}"}"

echo """--- Version to run: ${PG_VERSION}"""
echo """--- Path to run: ${PATH_IMG}"""

docker run -p $POSTGRES_PORT:5432 $DOCKER_IMAGE_TAG