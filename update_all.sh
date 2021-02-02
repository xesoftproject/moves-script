#!/bin/bash

# should be called for update all the sources (even move-script); also calls stop and start

. "$(dirname "${0}")/stop.sh"

pushd moves-script; git pull; popd

. "$(dirname "${0}")/update.sh"
