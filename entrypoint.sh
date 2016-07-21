#!/bin/sh

# wait for hub and chrome ready before starting the test
sleep ${WAIT:-3}

while true; do
  node_modules/.bin/wdio
  sleep ${INTERVAL:-1h}
done
