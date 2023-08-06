#! /bin/bash

INPUT_FILE=$1
SPECIFIED_LENGTH=6
TOTAL_LENGTH=0

for WORD in $(cat $INPUT_FILE)
do
    LENGTH_OF_WORD=$(echo -n $WORD | wc -c )
  
  if [ $LENGTH_OF_WORD -ge $SPECIFIED_LENGTH ]
  then
    TOTAL_LENGTH=$(dc -e "$TOTAL_LENGTH $LENGTH_OF_WORD + p")
  fi
done

echo $TOTAL_LENGTH

exit
