#!/bin/zsh

NUMBER1=$1
NUMBER2=$2
NUMBER3=$3

MAX_OF_TWO=$(./max_of_two.sh $NUMBER1 $NUMBER2)

./max_of_two.sh $MAX_OF_TWO $NUMBER3

