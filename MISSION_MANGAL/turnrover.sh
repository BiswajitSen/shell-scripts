#! /bin/zsh

DIRECTION=$1
INSTRUCTION=$2
dc -e " 2 $INSTRUCTION * $DIRECTION + 1 + 4 % p"  
