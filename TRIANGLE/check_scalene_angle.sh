#!/bin/zsh

FIRST_ANGLE=$1
SECOND_ANGLE=$2
THIRD_ANGLE=$3

IS_SCELENE=0

if [ $FIRST_ANGLE -eq $SECOND_ANGLE ]; then
    IS_SCELENE=1
fi

if [ $THIRD_ANGLE -eq $SECOND_ANGLE ]; then
    IS_SCELENE=1
fi

if [ $FIRST_ANGLE -eq $THIRD_ANGLE ]; then
    IS_SCELENE=1
fi

echo $IS_SCELENE

