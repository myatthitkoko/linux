#!/bin/bash
#Fibonacci sequence

echo -n "Enter the nth sequence number: "
read num

a=0
b=1

for ((i = 0; i <= num; i++))
do
    case $((i % 10)) in
        1) suffix="st" ;;
        2) suffix="nd" ;;
        3) suffix="rd" ;;
        *) suffix="th" ;;
    esac

    echo "${i}${suffix} term = $a"

    next=$((a + b))
    a=$b
    b=$next
done