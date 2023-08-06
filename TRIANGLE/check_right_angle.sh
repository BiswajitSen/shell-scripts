#!/bin/zsh

FIRST_ANGLE=$1
SECOND_ANGLE=$2
THIRD_ANGLE=$3

IS_ANGLE_EQUAL=1

if [ $FIRST_ANGLE -eq 90 ]; then
    IS_ANGLE_EQUAL=0
fi


if [ $SECOND_ANGLE -eq 90 ]; then
    IS_ANGLE_EQUAL=0
fi


if [ $THIRD_ANGLE -eq 90 ]; then
    IS_ANGLE_EQUAL=0
fi

echo $IS_ANGLE_EQUAL
