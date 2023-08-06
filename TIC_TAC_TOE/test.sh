#! /bin/zsh
check_horizontal(){
 local BOARD=$BOARD
 local  ROW_FLAG=-1
 for ROW in {1..3}
 do
   UNIQUE_ROW_ELEMENT=$(echo $BOARD |head -n$ROW | tail -n1 | tr " " '\n' | sort -u | wc -l)
   if [ $UNIQUE_ROW_ELEMENT -eq 1 ]; then
     echo 1
     return 1
   else
     echo 0
     return 0
   fi
 done

}

check_vertical(){
 local BOARD=$BOARD
 COLUMN_FLAG=-1
 for COLUMN in {1..3}
   COLUMN_FLAG=$(get_vertical_element_count $BOARD $COLUMN)
   if [ $COLUMN_FLAG -eq 1 ]; then
     echo 1
     return 1
   fi
  echo 0
  return 0
}

get_vertical_element_count(){
 local COLUMN=$COLUMN
 local BOARD=$BOARD
 local COUNT=$(echo $BOARD | cut -w -f1 | sort -u | wc -l )
 echo $COUNT
}
echo test1
BOARD="1 2 3\n4 5 6\n7 8 9"
echo $BOARD
check_vertical $BOARD
check_horizontal $BOARD
echo test2
BOARD="O O X\nO O O\nO X X"
echo $BOARD
check_vertical $BOARD
check_horizontal $BOARD
BOARD="O X X\nO X O\nO X 9"
echo $BOARD
echo test3
check_vertical $BOARD
check_horizontal $BOARD
BOARD="O X X\nO X O\nO X 9"
echo $BOARD
echo test4
check_vertical $BOARD
check_horizontal $BOARD
