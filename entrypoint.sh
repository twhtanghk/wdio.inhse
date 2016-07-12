#!/bin/sh

# wait for hub and chrome ready before starting the test
sleep ${WAIT:-3}
node_modules/.bin/wdio
