#!/usr/bin/env bash

clear
# echo bitbake text
./bitbake.sh
# Pull bitbake args into array
mapfile -t arr < bitbakeargs.txt

task=0
NUMTASKS=2586

echo "Currently 7 running tasks ($task of $NUMTASKS):"

threadlist='1 2 3 4 5 6 7'
# Fake threading using background processes
run () {
    local t=$1
    local i
    echo $t

    while true
    do
        # Have the newer tasks complete faster
        case "$1" in

        7)  sleep $[ ( $RANDOM % 50 ) + 1 ]s
            ;;
        6)  sleep $[ ( $RANDOM % 25 ) + 1 ]s
            ;;
        5)  sleep $[ ( $RANDOM % 15 ) + 1 ]s
            ;;
        4)  sleep $[ ( $RANDOM % 10 ) + 1 ]s
            ;;
        3)  sleep $[ ( $RANDOM % 8 ) + 1 ]s
            ;;
        2)  sleep $[ ( $RANDOM % 4 ) + 1 ]s
            ;;
        1)  sleep $[ ( $RANDOM % 2 ) + 1 ]s
            task=$((task+1))
            # Lock
            (
            flock -x -w 10 200 || exit 1
            echo -en "\r\e[8A\e[KCurrently 7 running tasks ($task of $NUMTASKS):"
            echo -en "\e[8B"
            ) 200>/tmp/bitbakelock

            # End the simulation
            if [ $task -eq $NUMTASKS ]
            then
                sleep 5
                pkill bash
                echo "Bitbake Succeeded!"
            fi
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

