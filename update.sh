#!/bin/bash

# should be called for update the sources; also calls stop and start

. "$(dirname "${0}")/stop.sh"

pushd moves; git pull; popd

. venv/bin/activate
pip install --upgrade ./moves
deactivate

. "$(dirname "${0}")/start.sh"
