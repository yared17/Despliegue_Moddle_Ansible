#!/bin/bash
echo "Detediendo dockers"
docker stop server01 server02 server03
echo "Dockers detenidos"
echo
echo "----------------------"
echo "Eliminando dockers"
docker rm server01 server02 server03
echo "Dockers eliminados."
echo
echo "----------------------"
echo "Eliminando configuración residual en ssh"
sed -i '' "/server01/d" $HOME/.ssh/known_hosts
echo "Limpieza lista."
echo
echo "----------------------"
echo "Recreando dockers"

./create_dockers.sh server:16.04

ssh -o StrictHostKeyChecking=no root@server01 -p 2221 -i key.private hostname

echo "Adicionadas las llaves ssh."
echo
echo "----------------------"
echo "Sigue con ansible002"
