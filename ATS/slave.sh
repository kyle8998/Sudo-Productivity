#!/bin/env bash

echo Slave Configuration:
sleep .1
echo containerDir: /home/testbot
echo dataDir: /home/automated_test_system
echo dirCouriersInProgress: /tmp/couriersInProgress
echo slaveDir: /home/automated_test_system/slave
echo stateDir: /home/automated_test_system/tmp
sleep .1
echo wfc:
echo wfs: localhost
echo wfsp: 5000

for i in {1..100}
do
    sleep 1
    echo courier: noCourier
done

sleep 10000
