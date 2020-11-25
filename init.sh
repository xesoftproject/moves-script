#!/bin/bash

# should be called just ONCE, after the ec2 installation

sudo apt update
sudo apt upgrade
sudo apt install python3-venv stockfish
python3 -mvenv venv
. venv/bin/activate
pip install --upgrade pip pkg-resources setuptools wheel

git clone https://github.com/xesoftproject/moves.git

# update sources
PUBLIC_HOSTNAME='ec2-'"$(curl -s ifconfig.me|sed 's/\./-/g')"'.eu-west-1.compute.amazonaws.com'
sed -i "/EC2_HOSTNAME/s/'[^']*'/'${HOSTNAME}'/" moves/moves/configurations/__init__.py
sed -i "/REST_HOSTNAME/s/'[^']*'/'${PUBLIC_HOSTNAME}'/" moves/moves/configurations/__init__.py
pushd moves; git add .; git commit -m 'update aws stuff'; popd
 # TODO push

pip install --upgrade ./moves
deactivate

# TODO certs




