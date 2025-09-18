#!/bin/bash


IFS=$'\n'

ret=$'\n'

files=$(<hosts.dat)

for line in $files
do
  n=${line:1:1}
  echo $n
  ip=$(echo $line | cut -d " " -f 1)
  nombre=$(echo $line | cut -d " " -f 3)
  echo "==================================== "$nombre" ========================================="
  ./ls_misc.sh $ip $nombre
done 




