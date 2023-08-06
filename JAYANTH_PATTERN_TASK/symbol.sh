#! /bin/zsh

function create_random_pattern(){
  jot -r 8 1 2 
}
#A set consists of 2 lines

function genarate_coresponding_pair_line(){
  local NUMBER_OF_SET=4
  local CURRENT_SET=0
  local FIRST_LINE
  local SECOND_LINE
  while [ $NUMBER_OF_SET -ne $CURRENT_SET ]
  do
    RANDOM_NUMBER=$(create_random_pattern)
    FIRST_LINE=$(echo $RANDOM_NUMBER | sed -e 's#2# \\#' -e 's#1#/ #' | tr -d '\n')
    SECOND_LINE=$(echo $RANDOM_NUMBER | sed -e 's#2#\\ #' -e 's#1# /#' | tr -d '\n')
    CURRENT_SET=$( dc -e "$CURRENT_SET 1 + p")
    echo $FIRST_LINE
    echo $SECOND_LINE 
  done
}

function main(){
genarate_coresponding_pair_line
}

main
