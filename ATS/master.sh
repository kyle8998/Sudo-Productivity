#!/usr/bin/env bash

echo Master Configuration:
sleep .1
echo dataDir: /home/automated_test_system/conf
echo dirCouriers: /tmp/couriers
echo dirCouriersDead: /tmp/couriersDead
echo dirCouriersInProgress: /tmp/couriersInProgress
sleep .2
echo keyAddr: localhost
echo keyPort: 6543
echo masterPort: 5000
echo quiesce: 2
echo slave_dataDir: /home/automated_test_system
sleep .5
echo "{'ReleaseTest': {'states': ['build', 'fetch', 'notify', 'package', 'test'], 'start': 'fetch', 'end': ['notify'], 'actions': {'test': {'default': {'action': 'transition', 'glob': None, 'endState': 'test', 'key': None}, 'complete': {'action': 'join', 'glob': None, 'endState': 'package', 'key': 'requirementId'}, 'error': {'action': 'error', 'glob': None, 'endState': 'notify', 'key': 'requirementId'}}, 'package': {'default': {'action': 'transition', 'glob': None, 'endState': 'package', 'key': None}, 'complete': {'action': 'transition', 'glob': None, 'endState': 'notify', 'key': None}, 'error': {'action': 'error', 'glob': None, 'endState': 'notify', 'key': 'requirementId'}}, 'fetch': {'default': {'action': 'transition', 'glob': None, 'endState': 'fetch', 'key': None}, 'complete': {'action': 'copy', 'glob': '/home/automated_test_system/testBoards/*', 'endState': 'build', 'key': 'boardId'}, 'error': {'action': 'error', 'glob': None, 'endState': 'notify', 'key': 'requirementId'}}, 'build': {'default': {'action': 'transition', 'glob': None, 'endState': 'build', 'key': None}, 'complete': {'action': 'split', 'glob': '/home/automated_test_system/scripts/procedures/*', 'endState': 'test', 'key': 'requirementId'}, 'error': {'action': 'error', 'glob': None, 'endState': 'notify', 'key': 'requirementId'}}}}}"
echo "* Running on http://0.0.0.0:5000/ (Press CTRL+C to quit)"

for i in {1..100}
do
    sleep 2
    time=$(date +%d/%b/%Y%_H:%M:%S)
    echo "127.0.0.1 - - [$time] \"GET /getCourier/ HTTP/1.1\" 200 -"
done

sleep 10000
