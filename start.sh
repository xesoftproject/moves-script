#!/bin/bash

# should be called to start the applications

. venv/bin/activate

sudo venv/bin/moves-web &
echo $! > MOVES_WEB_PID

sudo venv/bin/moves-rest &
echo $! > MOVES_REST_PID

sudo venv/bin/moves-chat &
echo $! > MOVES_CHAT_PID

deactivate
