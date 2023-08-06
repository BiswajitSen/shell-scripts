#! /bin/bash

function generate_random_number() {
  jot -r 1 0 5
}

function input_guessed_number() {
  read -p "Enter you guess: " GUESSED_NUMBER
  echo $GUESSED_NUMBER
}

function increase_by_one() {
  TIMES_GUESSED=$1
  dc -e "$TIMES_GUESSED 1 + p"
}

function is_equal() {
  local GUESSED_NUMBER=$1
  local RANDOM_NUMBER=$2

  [ $GUESSED_NUMBER -eq $RANDOM_NUMBER ]
}

function play_guess_the_number() {
 local RANDOM_NUMBER=$1
 local CHANCES=$2
 local TIMES_GUESSED=0
 local GUESSED_NUMBER

 echo "CHANCES = $CHANCES"
 while [ $TIMES_GUESSED -lt $CHANCES ]
 do
   GUESSED_NUMBER=$(input_guessed_number)
   if is_equal $GUESSED_NUMBER $RANDOM_NUMBER ; then
     return 0
   fi
   TIMES_GUESSED=$(increase_by_one $TIMES_GUESSED)
 done
 return 1
}

function display_result(){
  WINNING_STATUS=$1
  if [ $WINNING_STATUS -eq 0 ]; then
    echo "YOU WIN !!!"
    return
  fi
  echo "YOU LOSE !!!"
}

function main() {
  local RANDOM_NUMBER=$(generate_random_number)
  local CHANCES=3
  local WINNING_STATUS=1
  echo $RANDOM_NUMBER

  play_guess_the_number $RANDOM_NUMBER $CHANCES 
  WINNING_STATUS=$?
  display_result $WINNING_STATUS
}

main
