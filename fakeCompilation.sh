#!/bin/bash
collect()
{
    while read line;do
        if [ -d "$line" ];then
            (for i in "$line"/*;do echo $i;done)|sort -R|collect
            echo $line
        elif [[ "$line" == *".h" ]];then
            echo $line
        fi
    done
}

sse="$(awk '/flags/{print;exit}' </proc/cpuinfo|grep -o 'sse\S*'|sed 's/^/-m/'|xargs)"

flags=""
pd="\\"

while true;do
    collect <<< /usr/include|cut -d/ -f4-|
    (
        while read line;do
            if [ "$(dirname "$line")" != "$pd" ];then
                x=$((RANDOM%8-3))
                if [[ "$x" != "-"* ]];then
                    ssef="$(sed 's/\( *\S\S*\)\{'"$x,$x"'\}$//' <<< "$sse")"
                fi
                pd="$(dirname "$line")"
                opt="-O$((RANDOM%4))"
                if [[ "$((RANDOM%2))" == 0 ]];then
                    pipe=-pipe
                fi
                case $((RANDOM%4)) in
                    0) arch=-m32;;
                    1) arch="";;
                    *) arch=-m64;;
                esac
                if [[ "$((RANDOM%3))" == 0 ]];then
                    gnu="-D_GNU_SOURCE=1 -D_REENTRANT -D_POSIX_C_SOURCE=200112L "
                fi
                flags="gcc -w $(xargs -n1 <<< "opt pipe gnu ssef arch"|sort -R|(while read line;do eval echo \$$line;done))"
            fi
            if [ -d "/usr/include/$line" ];then
                echo $flags -shared $(for i in /usr/include/$line/*.h;do cut -d/ -f4- <<< "$i"|sed 's/h$/o/';done) -o "$line"".so"
                sleep $((RANDOM%2+1))
            else
                line=$(sed 's/h$//' <<< "$line")
                echo $flags -c $line"c" -o $line"o"
                sleep 0.$((RANDOM%4))
            fi
        done
    )
done
