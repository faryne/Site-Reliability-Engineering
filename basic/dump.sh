#!/bin/sh 

PASSWORD=$1
PORT=$2

if [ -z "$PASSWORD" ] || [ -z "$PORT" ]; then
    echo "Usage: $0 <password> <port>"
    exit 1
fi

DOCKER_PATH=$(which docker)

if [ -z "$DOCKER_PATH" ]; then
    echo "Docker is not installed"
    exit 1
fi

## starting mysql container
docker run -itd --name mysql57 --rm -e MYSQL_ROOT_PASSWORD=${PASSWORD} -p${PORT}:3306 mysql:5.7.35 && \
    echo "starting mysql container with root / $PASSWORD; currently exposed port $PORT" || \
    echo "failed to start mysql container"

MYSQL_BASIC_CMD="-u root -p${PASSWORD} -P ${PORT}"

## import sample sql to database
$(${MYSQL_BASIC_CMD} -e "source ${PWD}/sqls/employee.sql")
DATABASES=($(mysql ${MYSQL_BASIC_CMD} -e "show databases;" | awk '{print $1}'))

## check folder exists ?
BACKUP_FOLDER="${PWD}/mysql_backup"
test -d "${BACKUP_FOLDER}" || mkdir "${BACKUP_FOLDER}"

## ready to dump database
D=$(date +"%Y%m%d%H")
for DATABASE in ${DATABASES[@]}; do
    if [ "$DATABASE" != "Database" ] ; then
        $(mysql ${MYSQL_BASIC_CMD} --databases ${DATABASE} > ${BACKUP_FOLDER}/${DATABASE}_${D}.sql)
        tar -cvf ${BACKUP_FOLDER}/${DATABASE}_${D}.tar.gz ${BACKUP_FOLDER}/${DATABASE}_${D}.sql
    fi
done

## delete backup files over 10 days
find -type f -name "*.sql" -mtime +10 -exec rm -f {} \;

## stop container
docker stop mysql57
