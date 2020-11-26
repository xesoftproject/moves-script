#!/bin/bash

# should be called just ONCE, after the ec2 installation

sudo apt update
sudo apt upgrade
sudo apt install python3-venv stockfish python-is-python3
python -mvenv venv
. venv/bin/activate
pip install --upgrade pip pkg-resources setuptools wheel

git clone https://github.com/xesoftproject/moves.git

# update sources
PUBLIC_HOSTNAME='ec2-'"$(curl -s ifconfig.me|sed 's/\./-/g')"'.eu-west-1.compute.amazonaws.com'
sed -i "/EC2_HOSTNAME/s/'[^']*'/'${HOSTNAME}'/" moves/moves/configurations/__init__.py
pushd moves; git add .; git commit -m 'update aws stuff'; popd
 # TODO push

pip install --upgrade ./moves
deactivate

sudo snap install core; sudo snap refresh core
sudo snap install --classic certbot
sudo ln -s /snap/bin/certbot /usr/bin/certbot
sudo certbot certonly --standalone

# IMPORTANT NOTES:
#  - Congratulations! Your certificate and chain have been saved at:
#    /etc/letsencrypt/live/www.xesoft.ml/fullchain.pem
#    Your key file has been saved at:
#    /etc/letsencrypt/live/www.xesoft.ml/privkey.pem
#    Your cert will expire on 2021-02-24. To obtain a new or tweaked
#    version of this certificate in the future, simply run certbot
#    again. To non-interactively renew *all* of your certificates, run
#    "certbot renew"
#  - If you like Certbot, please consider supporting our work by:
# 
#    Donating to ISRG / Let's Encrypt:   https://letsencrypt.org/donate
#    Donating to EFF:                    https://eff.org/donate-le

sudo find /etc/letsencrypt -type d | sudo xargs chmod a+rx
sudo a+r /etc/letsencrypt/live/www.xesoft.ml/cert.pem
sudo a+r /etc/letsencrypt/live/www.xesoft.ml/privkey.pem
