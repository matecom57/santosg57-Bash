#!/bin/bash

ip=$1

ssh santosg@${ip} <<'ENDSSH'
  df -h
ENDSSH


