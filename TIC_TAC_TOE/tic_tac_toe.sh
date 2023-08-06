#! /bin/zsh

function check_if_position_is_valid(){
  local BOARD=$BOARD 
  local POSITION=$POSITION
  echo $BOARD | grep "$POSITION" >/dev/null
  echo $?
}

function update_board(){
  local SYMBOL=$SYMBOL
  local POSITION=$POSITION
  local BOARD=$BOARD
  echo $BOARD | sed "s/$POSITION/$SYMBOL/"
}

function get_position(){
  local POSITION
  local SYMBOL=$SYMBOL
  read POSITION
  echo $POSITION
}

function display_board(){
  local BOARD=$BOARD
  echo $BOARD
  echo "-----"
}

function place_X_in_the_board(){
  local BOARD=$BOARD
  local SYMBOL='X'
  local POSITION=$(get_position $SYMBOL)
  local FLAG=$(check_if_position_is_valid $BOARD $POSITION)
  if [ $FLAG -eq 0 ]; then
    BOARD=$(update_board $SYMBOL $POSITION $BOARD)
  else
    place_X_in_the_board $BOARD
  fi
  echo $BOARD
}

function place_O_in_the_board(){
  local BOARD=$BOARD
  local SYMBOL='O'
  local POSITION=$(get_position $SYMBOL)
  local FLAG=$(check_if_position_is_valid $BOARD $POSITION)
  if [ $FLAG -eq 0 ]; then
    BOARD=$(update_board $SYMBOL $POSITION $BOARD)
    echo $BOARD
  else
    place_O_in_the_board $BOARD
  fi
}

function check_if_any_box_left(){
  local BOARD=$BOARD
  echo $BOARD | grep "[1-9]" >/dev/null
  echo $?
}

#ADD CHECK WINNER TO THIS BLOCK
function is_board_over(){
  local BOARD=$BOARD
  check_if_any_box_left $BOARD
}


function count_downward_unique_element(){
  local BOARD=$BOARD
  FIRST_ROW_FIRST_COLUMN=$( echo $BOARD | cut -w -f1 | head -n1 )
  SECONED_ROW_SECOND_COLUMN=$( echo $BOARD | cut -w -f2 | head -n2 | tail -n1 )
  THIRD_ROW_THIRD_COLUMN=$( echo $BOARD | cut -w -f3 | tail -n1 )
  if [ $FIRST_ROW_FIRST_COLUMN = $SECONED_ROW_SECOND_COLUMN -a $SECONED_ROW_SECOND_COLUMN = $THIRD_ROW_THIRD_COLUMN ]; then 
    echo 1
    return 1
  fi  
  echo 0
  return 0
}

function count_upward_diagonal_unique_element(){
  local BOARD=$BOARD
  FIRST_ROW_THIRD_COLUMN=$( echo $BOARD | cut -w -f3 | head -n1 )
  SECONED_ROW_SECOND_COLUMN=$( echo $BOARD | cut -w -f2 | head -n2 | tail -n1 )
  THIRD_ROW_FIRST_COLUMN=$( echo $BOARD | cut -w -f1 | tail -n1 )
  if [ $FIRST_ROW_THIRD_COLUMN = $SECONED_ROW_SECOND_COLUMN -a $SECONED_ROW_SECOND_COLUMN = $THIRD_ROW_FIRST_COLUMN ]; then 
    echo 1
    return 1
  fi  
  echo 0
  return 0
}

function check_diagonal(){
  local BOARD=$BOARD
  DOWNWARD_DIAGONAL=$(count_downward_unique_element $BOARD)
  UPWARD_DIAGONAL=$(count_upward_diagonal_unique_element $BOARD)
  GAME_DIRECTION_FLAG=$(dc -e "$DOWNWARD_DIAGONAL $UPWARD_DIAGONAL + p")
  if [ $GAME_DIRECTION_FLAG -ge 1 ]; then
    echo 1
    return 1
  fi  
  echo 0
  return 0
}

check_horizontal(){
  local BOARD=$BOARD
  # local  ROW_FLAG=-1
  for ROW in {1..3}
  do
    UNIQUE_ROW_ELEMENT=$(get_horizontal_element_count $ROW $BOARD)
    if [ $UNIQUE_ROW_ELEMENT -eq 1 ]; then
      echo 1
      return 1
    fi
  done
  echo 0
  return 0

}

get_horizontal_element_count(){
  local COLUMN=$ROW
  local BOARD=$BOARD
  echo $BOARD |head -n$ROW | tail -n1 | tr " " '\n' | sort -u | wc -l
}

check_vertical(){
  local BOARD=$BOARD
  # local UNIQUE_COLUMN_ELEMENT=-1
  for COLUMN in {1..3}
  do
    UNIQUE_COLUMN_ELEMENT=$(get_vertical_element_count $COLUMN $BOARD)
    if [ $UNIQUE_COLUMN_ELEMENT -eq 1 ]; then
      echo 1
      return 1
    fi
  done
  echo 0
  return 0
}

function get_vertical_element_count(){
  local COLUMN=$COLUMN
  local BOARD=$BOARD
  echo $BOARD | cut -w -f$COLUMN | sort -u | wc -l 
}


function check_winner(){
  local BOARD=$BOARD
  flag_for_horizontal_checking=$(check_horizontal $BOARD)
  flag_for_vertical_checking=$(check_vertical $BOARD)
  flag_for_diagonal_checking=$(check_diagonal $BOARD)
  dc -e " $flag_for_vertical_checking $flag_for_horizontal_checking + $flag_for_diagonal_checking + p"
}

function main(){
  local BOARD="1 2 3\n4 5 6\n7 8 9"
  local FLAG_FOR_BOARD_CHECKING=0

  display_board $BOARD

  while [ $FLAG_FOR_BOARD_CHECKING -ne 1 ]
  do
    echo -n "PLAYER1: "
    BOARD=$(place_X_in_the_board $BOARD)
    FLAG_FOR_BOARD_CHECKING=$(is_board_over $BOARD)
    display_board $BOARD
    WINNER_FLAG=$(check_winner $BOARD)
    if [ $FLAG_FOR_BOARD_CHECKING -eq 1 -o $WINNER_FLAG -ge 1 ]; then
      echo "GAME OVER !!!"
      return 1
    fi


    echo -n "PLAYER2: "
    BOARD=$(place_O_in_the_board $BOARD)  
    FLAG_FOR_BOARD_CHECKING=$(is_board_over $BOARD)
    display_board $BOARD
    WINNER_FLAG=$(check_winner $BOARD)
    if [ $FLAG_FOR_BOARD_CHECKING -eq 1 -o $WINNER_FLAG -ge 1 ]; then
      echo "GAME OVER !!!"
      return 1
    fi

  done
}

#DRIVER CALL
main

