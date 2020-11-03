#!/bin/bash

DATA_DIR_DEFAULT="~/data"
ADMINER_PORT_DEFAULT="8080"
DB_PORT_DEFAULT="3306"
NOTEBOOK_PORT_DEFAULT="8888"
NOTEBOOK_DIR_DEFAULT="~/data"
USER=$( whoami )
UID=$( id -u )
DB_PASSWORD_DEFAULT="root"

read -e -p "Data path (${DATA_DIR_DEFAULT}):" DATA_DIR
read -e -p "Notebook path (${NOTEBOOK_DIR_DEFAULT}):" NOTBOOK_DIR
read -e -p "Notebook port (${NOTEBOOK_PORT_DEFAULT}):" NOTEBOOK_PORT
read -e -p "Database port (${DB_PORT_DEFAULT}):" DB_PORT
read -e -p "Adminer port (${ADMINER_PORT_DEFAULT}):" ADMINER_PORT
read -e -p "Database password (${DB_PASSWORD_DEFAULT}):" DB_PASSWORD

DATA_DIR=${DATA_DIR:-$DATA_DIR_DEFAULT}
ADMINER_PORT=${ADMINER_PORT:-$ADMINER_PORT_DEFAULT}
DB_PORT=${DB_PORT:-$DB_PORT_DEFAULT}
NOTEBOOK_PORT=${NOTEBOOK_PORT:-$NOTEBOOK_PORT_DEFAULT}
NOTEBOOK_DIR=${NOTEBOOK_DIR:-$NOTEBOOK_DIR_DEFAULT}
DB_PASSWORD=${DB_PASSWORD:-$DB_PASSWORD_DEFAULT}


cp ./template/docker-compose.tpl.yml ./docker-compose.yml
sed -i.bak "s|{DATA_DIR}|${DATA_DIR}|g" docker-compose.yml && rm docker-compose.yml.bak
sed -i.bak "s|{NOTEBOOK_DIR}|${NOTEBOOK_DIR}|g" docker-compose.yml && rm docker-compose.yml.bak
sed -i.bak "s|{NOTEBOOK_PORT}|${NOTEBOOK_PORT}|g" docker-compose.yml && rm docker-compose.yml.bak
sed -i.bak "s|{DB_PORT}|${DB_PORT}|g" docker-compose.yml && rm docker-compose.yml.bak
sed -i.bak "s|{ADMINER_PORT}|${ADMINER_PORT}|g" docker-compose.yml && rm docker-compose.yml.bak
sed -i.bak "s|{USER}|${USER}|g" docker-compose.yml && rm docker-compose.yml.bak
sed -i.bak "s|{UID}|${UID}|g" docker-compose.yml && rm docker-compose.yml.bak
sed -i.bak "s|{DB_PASSWORD}|${DB_PASSWORD}|g" docker-compose.yml && rm docker-compose.yml.bak

cp ./template/jupyter.Dockerfile ./build/jupyter/Dockerfile
sed -i.bak "s|{USER}|${USER}|g" ./build/jupyter/Dockerfile && rm ./build/jupyter/Dockerfile.bak