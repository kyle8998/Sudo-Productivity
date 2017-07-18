#!/usr/bin/env bash

# echo bitbake text
./bitbake.sh
# Pull bitbake args into array
mapfile -t arr < bitbakeargs.txt

task=0
echo "Currently 3 running tasks ($task of ?):"

threadlist='1 2 3'
# Fake threading using background processes
run () {
    local t=$1
    local i
    echo $t

    while true
    #for i in "${arr[@]}"
    do
        i=$[ ( $RANDOM % 10 ) + 0 ]
        #sleep 1
        sleep $[ ( $RANDOM % 10 ) + 1 ]s
        echo -en "\r\e[$1A\e[K${arr[$i]}"
        echo -en "\e[$1B"

        update
        #task=$?
        #task="$(update)"
        #echo -en "\r\e[4A\e[KCurrently 3 running tasks ($task of ?):"
        #echo -en "\e[4B"

    done
    echo
}
# Update counter
update () {
    task=$((task+1))
    echo -en "\r\e[4A\e[KCurrently 3 running tasks ($task of ?):"
    echo -en "\e[4B"
   # return $((task+1))
}
# Create "threads"
for t in $threadlist
do
    run "$t" &
done

