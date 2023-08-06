#!/bin/zsh

YEAR=$1
IS_DIVISIBLE_BY_4=$(dc -e "$YEAR 4 % p")
IS_DIVISIBLE_BY_100=$(dc -e "$YEAR 100 % p")
IS_DIVISIBLE_BY_400=$(dc -e "$YEAR 400 % p")
IS_LEAP_YEAR=1

if [ $IS_DIVISIBLE_BY_4 -eq 0 ]; then
   IS_LEAP_YEAR=0
fi

if [ $IS_DIVISIBLE_BY_100 -eq 0 ]; then
    IS_LEAP_YEAR=1
fi

if [ $IS_DIVISIBLE_BY_400 -eq 0 ]; then
    IS_LEAP_YEAR=0
fi

echo "$IS_LEAP_YEAR"
