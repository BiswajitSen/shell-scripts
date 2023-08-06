#! /bin/bash

function roll_dice() {
  jot -r 1 1 6
}

function make_board() {
  local BOARD_INDEX=100
  for row in {1..10}
  do
    for column in {1..10}
    do 
      echo -e $BOARD_INDEX
      dc -e "$BOARD_INDEX 1 -"
      ""
    }

    function 
    make_board
