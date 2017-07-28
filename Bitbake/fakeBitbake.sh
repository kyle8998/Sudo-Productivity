#!/usr/bin/env bash

clear

progress='#'
number=0
space="                                                                                                     "
time=10
echo
for i in {1..101}
do
    echo -ne "\rParsing Recipes: $number% |$progress$space| Time: 00:00:$time"
    progress+="#"
    space="${space::-1}"
    number=$((number+1))

    sleepTime=$(bc <<< "scale=2; $(printf '0.%02d' $(( $RANDOM % 100))) / 2")
    sleep $sleepTime

    if [[ $i%10 -eq 0 ]]
    then
        time=$((time-1))
    fi
    if [[ $i -eq 101 ]]
    then
        echo
    fi
done

# echo bitbake text
./initial.sh
# Pull bitbake args into array
mapfile -t arr < bitbakeargs.txt

task=0
NUMTASKS=2586
RAND=0
echo "Currently 8 running tasks ($task of $NUMTASKS):"

threadlist='1 2 3 4 5 6 7 8'
# Fake threading using background processes
run () {
    local t=$1
    local i
    echo $(( $t - 1 )): ${arr[$[ ( $RANDOM % 50 ) + 0 ]]}

    while true
    do
        # Have the newer tasks complete faster
        case "$1" in

        8)  sleep $[ ( $RANDOM % 50 ) + 1 ]s
            index=0
            ;;
        7)  sleep $[ ( $RANDOM % 30 ) + 1 ]s
            index=1
            ;;
        6)  sleep $[ ( $RANDOM % 20 ) + 1 ]s
            index=2
            ;;
        5)  sleep $[ ( $RANDOM % 12 ) + 1 ]s
            index=3
            ;;
        4)  sleep $[ ( $RANDOM % 8 ) + 1 ]s
            index=4
            ;;
        3)  sleep $[ ( $RANDOM % 4 ) + 1 ]s
            index=5
            ;;
        2)  sleep $[ ( $RANDOM % 3 ) + 1 ]s
            index=6
            ;;
        1)  sleep $[ ( $RANDOM % 2 ) + 0 ]s
            index=7
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
            echo -en "\r\e[9A\e[KCurrently 8 running tasks ($task of $NUMTASKS):"
            echo -en "\e[9B"
        fi

        if [ $RAND -eq 0 ]
        then
            echo -en "\r\e[$1A\e[K$index: ${arr[$i]}"
            echo -en "\e[$1B"

        else
            echo -en "\r\e[$1A\e[K"
            echo -en "\e[$1B"
            echo -en "\r\e[9A\e[KCurrently 7 running tasks ($task of $NUMTASKS):"
            echo -en "\e[9B"
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

# Hides the command line
sleep 10000
