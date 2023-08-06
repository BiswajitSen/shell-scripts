#! /bin/bash

if [ $1 -eq 0 ]; then 
  echo 1
  exit
fi

dc -e "$1 $(dc_fact $(dc -e "$1 1 - p")) * p"

