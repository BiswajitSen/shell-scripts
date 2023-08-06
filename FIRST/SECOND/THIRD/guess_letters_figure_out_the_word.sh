#! /bin/bash

function random_word_genarator() {
  cat /usr/share/dict/words | sort -R | head -n1
}

function display_current_state() {
  local WORD=$1
  local GUESSED_LETTERS_TILL_NOW=$2
  echo $WORD | sed "s/[^$GUESSED_LETTERS_TILL_NOW.]/_/g" 
}

function get_guessed_letter() {
  local GUESSED_LETTER
  read -p "Enter a letter to guess :" GUESSED_LETTER
  echo $GUESSED_LETTER 
}

function append_recently_guessed_letter() {
  local GUESSED_LETTER=$1
  local GUESSED_LETTERS_TILL_NOW=$2
  echo $GUESSED_LETTERS_TILL_NOW$GUESSED_LETTER
}

function get_letter_count() {
  local WORD=$1
  echo -n  $WORD | wc -c
}

function increment_time_guessed_by_one() {
  local TIMES_GUESSED=$1
  dc -e "$TIMES_GUESSED 1 + p"
}

function is_game_over() {
  local CURRENT_STATE=$1
  local WORD=$2
  [ $CURRENT_STATE = $WORD ]
}


function main() {
  local WORD=$(random_word_genarator)
  local TOTAL_GUESSES=$(get_letter_count $WORD)
  local TIMES_GUESSED=0
  local GUESSED_LETTER
  local GUESSED_LETTERS_TILL_NOW 
  local CURRENT_STATE 
  local PROMPT="You Lose !!!"
  echo $WORD

  display_current_state $WORD $GUESSED_LETTERS_TILL_NOW
  while [ $TIMES_GUESSED -ne $TOTAL_GUESSES ]
  do
    TIMES_GUESSED=$(increment_time_guessed_by_one $TIMES_GUESSED )
    GUESSED_LETTR=$(get_guessed_letter )
    GUESSED_LETTERS_TILL_NOW=$(append_recently_guessed_letter $GUESSED_LETTERS_TILL_NOW $GUESSED_LETTR)
    CURRENT_STATE=$(display_current_state $WORD $GUESSED_LETTERS_TILL_NOW)
    echo $CURRENT_STATE
    if is_game_over $CURRENT_STATE $WORD; then 
      PROMPT="You Win"
      echo $PROMPT
      return 0
    fi
  done
  echo PROMPT
} 

main
