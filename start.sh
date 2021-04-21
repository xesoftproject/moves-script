#!/bin/bash

# should be called to start the applications

. venv/bin/activate
sudo venv/bin/moves-rest &
echo $! > MOVES_REST_PID
deactivate

CONFIG_URL=config.yml sudo npm start &
echo $! > CHAT_PID
