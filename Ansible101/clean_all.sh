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
for i in `seq 1 3`;
do
  sed -i '' "/server0$i/d" $HOME/.ssh/known_hosts
  #ssh-keyscan -H server0$i -p 222$i >> $HOME/.ssh/known_hosts
done
echo "Limpieza lista."
echo
echo "----------------------"
echo "Recreando dockers"
./create_dockers.sh server:16.04

ssh -o StrictHostKeyChecking=no root@server01 -p 2221 -i key.private hostname
ssh -o StrictHostKeyChecking=no root@server02 -p 2222 -i key.private hostname
ssh -o StrictHostKeyChecking=no root@server03 -p 2223 -i key.private hostname
echo "Adicionadas las llaves ssh."
echo
echo "----------------------"
echo "Sigue con ansible001"
