#!/bin/zsh

NUMBER1=$1
NUMBER2=$2
NUMBER3=$3

if [ $NUMBER1 -gt $NUMBER2 ]; then
  MAX=$NUMBER1
else
  MAX=$NUMBER2
fi

if [ $NUMBER3 -gt $MAX ]; then
  MAX=$NUMBER3
fi

echo $MAX 
