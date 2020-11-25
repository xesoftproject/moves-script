#!/bin/bash

# should be called for update the sources; also calls stop and start

. "$(dirname "${0}")/stop.sh"

. venv/bin/activate
git pull
pip install --upgrade ./moves
deactivate

. "$(dirname "${0}")/start.sh"
