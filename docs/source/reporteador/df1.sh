#!/bin/bash

ip=$1

sshpass -p carlos21 ssh santosg@${ip} "df -h"

