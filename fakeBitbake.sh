#!/usr/bin/env bash

clear
# echo bitbake text
./bitbake.sh
# Pull bitbake args into array
mapfile -t arr < bitbakeargs.txt

task=0
NUMTASKS=2586
RAND=0

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
            index=0
            ;;
        6)  sleep $[ ( $RANDOM % 25 ) + 1 ]s
            index=1
            ;;
        5)  sleep $[ ( $RANDOM % 15 ) + 1 ]s
            index=2
            ;;
        4)  sleep $[ ( $RANDOM % 10 ) + 1 ]s
            index=3
            ;;
        3)  sleep $[ ( $RANDOM % 8 ) + 1 ]s
            index=4
            ;;
        2)  sleep $[ ( $RANDOM % 4 ) + 1 ]s
            index=5
            ;;
        1)  sleep $[ ( $RANDOM % 2 ) + 0 ]s
            index=6
            # Task only counted by last line
            # Not accurate, may be fixed in future
            task=$((task+1))

            # End the simulation
            if [ $task -eq $NUMTASKS ]
            then
                sleep 5
                # Kill processes
                pkill bash
                echo "Bitbake Succeeded!"
            fi
            ;;

        esac

        # Picks random bitbake argument to use
        i=$[ ( $RANDOM % 50 ) + 0 ]

        # Lock
        (
        flock -x -w 10 200 || exit 1

        if [ $1 -eq 1 ]
        then
            RAND=$(($RANDOM % 2))
            echo -en "\r\e[8A\e[KCurrently 7 running tasks ($task of $NUMTASKS):"
            echo -en "\e[8B"
        fi

        if [ $RAND -eq 0 ]
        then
            echo -en "\r\e[$1A\e[K$index: ${arr[$i]}"
            echo -en "\e[$1B"

        else
            echo -en "\r\e[$1A\e[K"
            echo -en "\e[$1B"
            echo -en "\r\e[8A\e[KCurrently 6 running tasks ($task of $NUMTASKS):"
            echo -en "\e[8B"
        fi

        ) 200>/tmp/bitbakelock

    done
    echo
}

# Create "threads"
for t in $threadlist
do
    run "$t" &
done

