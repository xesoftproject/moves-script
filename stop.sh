#!/bin/bash

# should be called to stop the applications

sudo kill "$(cat MOVES_REST_PID)" && rm MOVES_REST_PID
sudo kill "$(cat CHAT_PID)" && rm CHAT_PID
