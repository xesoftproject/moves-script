#!/bin/bash

# should be called to stop the applications

sudo kill "$(cat MOVES_WEB_PID)" && rm MOVES_WEB_PID
sudo kill "$(cat MOVES_REST_PID)" && rm MOVES_REST_PID
# sudo kill "$(cat MOVES_CHAT_PID)" && rm MOVES_CHAT_PID
sudo kill "$(cat CHAT_PID)" && rm CHAT_PID
