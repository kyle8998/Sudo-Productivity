#!/usr/bin/env bash

clear
# echo bitbake text
./bitbake.sh
# Pull bitbake args into array
mapfile -t arr < bitbakeargs.txt

task=0
echo "Currently 5 running tasks ($task of ?):"

threadlist='1 2 3 4 5'
# Fake threading using background processes
run () {
    local t=$1
    local i
    echo $t

    while true
    do
        # Have the newer tasks complete faster
        case "$1" in

        5)  sleep $[ ( $RANDOM % 10 ) + 1 ]s
            ;;
        4)  sleep $[ ( $RANDOM % 9 ) + 1 ]s
            ;;
        3)  sleep $[ ( $RANDOM % 8 ) + 1 ]s
            ;;
        2)  sleep $[ ( $RANDOM % 5 ) + 1 ]s
            ;;
        1)  sleep $[ ( $RANDOM % 2 ) + 1 ]s
            task=$((task+1))
            echo -en "\r\e[6A\e[KCurrently 5 running tasks ($task of ?):"
            echo -en "\e[6B"
            ;;

        esac

        i=$[ ( $RANDOM % 50 ) + 0 ]

        # Lock
        (

        flock -x -w 10 200 || exit 1

        echo -en "\r\e[$1A\e[K${arr[$i]}"
        echo -en "\e[$1B"

        ) 200>/tmp/bitbakelock

    done
    echo
}
# Create "threads"
for t in $threadlist
do
    run "$t" &
done

