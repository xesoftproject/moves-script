#!/bin/bash

# should be called for update the sources; also calls stop and start

. stop.sh

. venv/bin/activate
git pull
pip install --upgrade ./moves
deactivate

. start.sh
