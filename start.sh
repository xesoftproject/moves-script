#!/bin/bash

# should be called to start the applications

. venv/bin/activate
sudo moves-web &
echo $! > MOVES_WEB_PID
sudo moves-rest &
echo $! > MOVES_REST_PID
deactivate
