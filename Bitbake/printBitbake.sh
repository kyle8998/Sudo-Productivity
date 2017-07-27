#!/usr/bin/env bash

progress='#'
number=0
time=10
space="                                                                                                     "
echo
for i in {1..101}
do
    echo -ne "\rParsing Recipes: $number% |$progress$space| Time: 00:00:$time"
    progress+="#"
    space="${space::-1}"
    number=$((number+1))
    sleep .05
    if [[ $i%10 -eq 0 ]]
    then
        time=$((time-1))
    fi
    if [[ $i -eq 101 ]]
    then
        echo
    fi
done

cat pipedBitbake.txt | while read line
do
    echo $line
    sleep $[ ( $RANDOM % 2 ) + 0 ]s
done
