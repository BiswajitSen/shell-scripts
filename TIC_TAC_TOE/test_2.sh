#! /bin/zsh

function get_downward_match_flag(){
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

function get_upward_match_flag(){
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
  DOWNWARD_DIAGONAL=$(get_downward_match_flag $BOARD)
  UPWARD_DIAGONAL=$(get_upward_match_flag $BOARD)
  FINAL_FLAG=$(dc -e "$DOWNWARD_DIAGONAL $UPWARD_DIAGONAL + p")
  if [ $FINAL_FLAG -ge 1 ]; then
    echo 1
    return 1
  fi
  echo 0
  return 0
}


echo test1
BOARD="1 2 3\n4 5 6\n7 8 9"
echo $BOARD
check_diagonal
echo test2
BOARD="X X X\nO 5 O\nO 8 9"
echo $BOARD
check_diagonal
BOARD="O 1 X\nO 5 O\nO 8 9"
echo $BOARD
echo test3
check_diagonal
BOARD="O X X\nO X O\nO X 9"
echo $BOARD
echo test4
check_diagonal
BOARD="O X X\nO O O\nO X O"
echo $BOARD
echo test4
check_diagonal
BOARD="O X X\nO X O\nX X O"
echo $BOARD
echo test4
check_diagonal
