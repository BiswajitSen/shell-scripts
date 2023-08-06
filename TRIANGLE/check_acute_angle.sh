#!/bin/zsh

FIRST_ANGLE=$1
SECOND_ANGLE=$2
THIRD_ANGLE=$3

IS_ACUTE=0

if [ $FIRST_ANGLE -ge 90 ]; then
    IS_ACUTE=1
fi

if [ $THIRD_ANGLE -ge 90 ]; then
    IS_ACUTE=1
fi

if [ $FIRST_ANGLE -ge 90 ]; then
    IS_ACUTE=1
fi

echo $IS_ACUTE

