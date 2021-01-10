#!/bin/bash

# should be called for update the sources; also calls stop and start

. "$(dirname "${0}")/stop.sh"

pushd moves; git pull; popd
pushd chat; git pull; popd

. venv/bin/activate
pip install --upgrade ./moves
deactivate

pushd chat/_root/app; npm install; popd

. "$(dirname "${0}")/start.sh"
