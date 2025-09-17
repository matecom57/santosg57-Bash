#!/bin/bash


IFS=$'\n'

ret=$'\n'

files=$(<hosts.dat)

k=1
for line in $files
do
  ip=$(echo $line | cut -d " " -f 1)
  nombre=$(echo $line | cut -d " " -f 3)
  echo "=============== "$nombre" ================"
  ./bash01.sh $ip
#  if [[ "$ss" = "172.24.220" ]]; then
#    echo $k " -- " ${line}
#    ip=`echo ${line} | cut -d ' ' -f1`
#    echo $ip
#    nom2=$(sshpass -p carlos21 ssh -X -Y santosg@"$ip" "hostname")
#    echo $nom2
#    nom1=$(echo $line | rev | cut -d" " -f1 | rev)
#    echo $nom1
#    echo $nom2
#    if [ "$nom1" = "$nom2" ]
#    then
#      echo  $ret"---------------------------------------------------------------"
#    else
#       echo $ret" ========  $nom1 ================= MAL ========================"
#    fi 
#    k=$((k+1))
#  fi
done 



dir=`cat hosts.dat`
fecha=`date "+M%mD%dA%Y"`

hora=`date "+%H-%M-%S"`

#    sshpass -p carlos21 ssh -X -Y santosg@${file} "hostname"





