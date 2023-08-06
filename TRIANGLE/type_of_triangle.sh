#! /bin/zsh

FIRST_ANGLE=$1
SECOND_ANGLE=$2
THIRD_ANGLE=$3
SUM_OF_ANGLE=$(dc -e "$FIRST_ANGLE $SECOND_ANGLE $THIRD_ANGLE + + p")


if [ $SUM_OF_ANGLE -ne 180 ]; then
    echo "Not a valid triangle"
    exit
fi
 
IS_EQUILATERAL=$(./check_equilateral.sh $FIRST_ANGLE $SECOND_ANGLE $THIRD_ANGLE ) 
IS_RIGHT_ANGLED=$(./check_right_angle.sh $FIRST_ANGLE $SECOND_ANGLE $THIRD_ANGLE ) 
IS_SCALENE=$(./check_scalene_angle.sh $FIRST_ANGLE $SECOND_ANGLE $THIRD_ANGLE)
IS_ACUTE_ANGLED=$(./check_acute_angle.sh $FIRST_ANGLE $SECOND_ANGLE $THIRD_ANGLE)
IS_ISOSCELES=$(./check_isosceles.sh $FIRST_ANGLE $SECOND_ANGLE $THIRD_ANGLE)

if [ $IS_EQUILATERAL -eq 0 ]; then
  echo "equilateral triangle."
fi

if [ $IS_RIGHT_ANGLED -eq 0 ]; then
  echo " rightangle triangle."
fi

if [ $IS_SCALENE -eq 0 ]; then
  echo "scalene triangle."
fi

if [ $IS_ACUTE_ANGLED -eq 0 ]; then
  echo "acute triangle."
fi

if [ $IS_ISOSCELES -eq 0 ]; then
  echo "isosceles triangle."
fi

