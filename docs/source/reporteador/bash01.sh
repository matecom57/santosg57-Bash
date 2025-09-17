#!/bin/bash

ip=$1

sshpass -p carlos21 ssh santosg@${ip} <<'ENDSSH'
  df -h
ENDSSH


