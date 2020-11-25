#!/bin/bash

# should be called to start the applications

. venv/bin/activate
moves-web &
echo $! > MOVES_WEB_PID
moves-rest &
echo $! > MOVES_REST_PID
deactivate
