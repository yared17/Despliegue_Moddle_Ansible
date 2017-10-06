#!/bin/bash

DATA=$HOME/projects/CloudClass/ansible002/data
MYSQLPASS=123456

echo "Lanzando servidor web..."
docker run -d -P --name server01 -p 2221:22 -p 8000:80 $1
echo "Servidor desplegado."
echo
echo "----------------------"
echo "Lanzando servidor MySQL"
#docker run -d -P --name server02 -p 2222:22 -p 3306:3306 $1
docker run --name server02 -p 3306:3306 -v $DATA/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=$MYSQLPASS -d mysql
echo "Servidor desplegado."
echo
echo "----------------------"
echo "Lanzando servidor noSQL Redis"
#docker run -d -P --name server03 -p 2223:22 -p 6379:6379 $1
docker run --name server03 -p 6379:6379 -v $DATA/redis:/data -d redis:alpine redis-server --appendonly yes
echo "Servidor desplegado."
echo
echo "----------------------"
echo "     Confirmando      "
echo "----------------------"
docker ps
echo
echo "----------------------"
