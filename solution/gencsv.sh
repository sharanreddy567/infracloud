FIRST_NUM=0
LAST_NUM=10

RANDOM=$$

for i in `seq $FIRST_NUM $LAST_NUM`;
do
echo $i "," $RANDOM  >> inputFile
done
