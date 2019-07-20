#!/bin/bash

# setup SSH key
mkdir ~pi/.ssh
chmod 700 ~pi/.ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAk5qQWUPKfPlZoskXAHD1Yl0iSOCfavAoGeCYmVzer1oBgSHsP8B6rgiujHqJWu0kJMKk1xMjUGj04X5bO6FAWqEdoggMlx2M0eb8hF2CQafSzlcWXj3Vi4YtVdv+nLZn+3BFXz0FdCgeXfDlvVbazI6BES2ByAB3tzgWIijz6eDEGwdQB/MjIvSlMtAIKaBCTSNzKLBEXpp7zXN2HJyfTR6YDGEqfKHHOkCTtFDfJyc7NMnw/NQhUKFyrUZnKFTVfWy06NaDXJ12pFWCCA0U3iBUS22shqVZdhYP7xnMgAX/wrwRBgD/SNnUabpqIv/0D1t/ymaYPYCGXq7DT48nJw== rsa-key-20190124" > ~/.ssh/authorized_keys
chmod 700 ~pi/.ssh/authorized_keys
chown -R pi:pi ~pi/.ssh

# disable SSH password authenticaion
# from https://stackoverflow.com/questions/20898384/ssh-disable-password-authentication
sed -n 'H;${x;s/\#PasswordAuthentication yes/PasswordAuthentication no/;p;}' /etc/ssh/sshd_config > tmp_sshd_config
cat tmp_sshd_config > /etc/ssh/sshd_config
rm tmp_sshd_config

# reload sshd so it the new config is active
service ssh reload

# get latest
apt --yes update
apt --yes upgrade

# install git
apt --yes install git

# config git for user pi
sudo -u pi git config --global user.email "austin@mroczek.org"
sudo -u pi git config --global user.name "austinmroczek"

