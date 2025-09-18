#!/bin/bash

ip=$1
maquina=$2
echo $maquina

sshpass -p carlos21 ssh santosg@${ip}  "ls /misc/${maquina}/" 


