#!/bin/zsh

NUMBER1=$1
NUMBER2=$2

if [ $NUMBER1 -gt $NUMBER2 ]; then
  echo $NUMBER1
else 
  echo $NUMBER2
fi
