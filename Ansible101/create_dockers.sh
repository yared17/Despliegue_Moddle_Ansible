#!/bin/bash
echo "Lanzando servidor web..."
docker run -d -P --name server01 -p 2221:22 -p 80:80 $1
echo "Servidor desplegado."
echo
echo "----------------------"
echo "Lanzando servidor MySQL"
docker run -d -P --name server02 -p 2222:22 -p 3306:3306 $1
echo "Servidor desplegado."
echo
echo "----------------------"
echo "Lanzando servidor noSQL Redis"
docker run -d -P --name server03 -p 2223:22 -p 6379:6379 $1
echo "Servidor desplegado."
echo
echo "----------------------"
echo "     Confirmando      "
echo "----------------------"
docker ps
echo
echo "----------------------"
