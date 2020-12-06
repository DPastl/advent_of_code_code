#!/bin/bash

function decodeRow() {
    r1=${1//B/1}
    result=${r1//F/0}
    dresult=$((2#$result))
    echo $dresult
}

function decodeSeat() {
    r1=${1//R/1}
    result=${r1//L/0}
    # echo "Binary Result: $result"
    dresult=$((2#$result))
    # echo "Decimal Result: $dresult"
    echo $dresult
}

#line="BBFFBBFRLL"
#row="$(decodeRow ${line:0:7})"
#seat="$(decodeSeat ${line:(-3):3})"
#echo "Binary $line is Row $row, Seat $seat"

high_id=0
filename="input_5.txt"
while read line; do
    row="$(decodeRow ${line:0:7})"
    seat="$(decodeSeat ${line:(-3):3})"
    id=$((row*8+seat))
    
    if ((id > high_id)); then
        high_id=$id
    fi;
done < $filename

echo "Highest ID is $high_id"