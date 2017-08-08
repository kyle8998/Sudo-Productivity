#!/bin/env bash

echo "ReleaseTest Test Request tiggered for 216658d123w3fr8d8cc40ef948131271bf4172r4"

cat bitbakePrinted.txt | while read line
do
    echo $line
    sleep $[ ( $RANDOM % 2 ) + 0 ]s
done

sleep 10000
