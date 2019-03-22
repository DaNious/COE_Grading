#!/bin/bash
FILES="./FileDownload/*.asm"
TESTCASENO=4
for i in $FILES
do
    echo "Processing $i"
    mv $i ./Process
    cd ./Process
    file=${i##*/}
    filename=${file%.*}
    for j in $(seq 1 $TESTCASENO)
    do
	echo >> ../Results/"${filename}_result.txt"	
	echo "TEST CASE $j" >> ../Results/"${filename}_result.txt"  	
	python3 ./uncomment1Tests.py $j
    	java -jar ../_test_/Mars4_5.jar nc ${i##*/} >> ../Results/"${filename}_result.txt"
    done
    mv ${i##*/} ../FileDownload/
    cd ..
done
# Dummy test, if print fails on these test, it should be good
for i in $FILES
do
    echo "Processing Dummy $i"
    mv $i ./Dummy
    cd ./Dummy
    file=${i##*/}
    filename=${file%.*}
    for j in $(seq 1 $TESTCASENO)
    do
	echo >> ../Results/"${filename}_result.txt"	
	echo "DUMMY TEST CASE $j" >> ../Results/"${filename}_result.txt"  	
	python3 ./uncomment1Tests.py $j
    	java -jar ../_test_/Mars4_5.jar nc ${i##*/} >> ../Results/"${filename}_result.txt"
    done
    mv ${i##*/} ../FileDownload/
    cd ..
done




