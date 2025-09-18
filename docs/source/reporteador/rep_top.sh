#!/bin/bash


IFS=$'\n'

ret=$'\n'

files=$(<hosts.dat)

current_date_time="`date +A%y_M%m_D%d_H%H_M%M_S%S`";

for line in $files
do
  n=${line:1:1}
  ip=$(echo $line | cut -d " " -f 1)
  nombre=$(echo $line | cut -d " " -f 3)
  echo "==================================== "$nombre" =========================================" > ${nombre}_${current_date_time}.txt
  ./fecha.sh > ${nombre}_${current_date_time}.txt
  ./top1.sh $ip > ${nombre}_${current_date_time}.txt
done 




