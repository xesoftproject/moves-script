#!/bin/bash

# should be called to start the applications

. venv/bin/activate
sudo venv/bin/moves-rest &
echo $! > MOVES_REST_PID
deactivate

pushd chat
sudo CONFIG_URL=config.yml npm start &
popd chat
echo $! > CHAT_PID
