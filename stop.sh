#!/bin/bash

# should be called to stop the applications

sudo kill "$(cat MOVES_REST_PID)" && rm MOVES_REST_PID
sudo kill -- $(pstree -pTU | grep $(cat CHAT_PID) | sed -e 's/^[^(]*(//g' -e 's/)[^(]*(/ /g' -e 's/).*$//g') && rm CHAT_PID
