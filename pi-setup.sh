#!/bin/bash

# setup SSH key
mkdir ~pi/.ssh
chmod 700 ~pi/.ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCC7sdBOMlOHVHD2CWu7azNWMX3wtp0cpFMkS45A0PVZd8r9jgYaLOLHMuBmFZLJK4U186/xEhawk+By6WjqmMUwZGN/Qf14RAogUn/WQhCCSFCh4PNYcBiKwasW8rcL3xaD90bPH6/MTRCUKShXIHxSMzjUvNtxrLqnWkpebVTaFEVdLAZKq4yj7MdchEhQt/8aRZ3FLWSfvKJh53Ywi/ytgnBwLVqHd9EE3qBUcpGYGsunPWs8snpZ7KW7XRZpxTYD7u1dwog+YTS7zavHpuq1YmNhmIMbE+Kd+CfVtV6CNOvAHzpn4moNA7neJbTB2PgfJTOydg8JNCFSC51JH6H rsa-key-20210912" > ~pi/.ssh/authorized_keys
chmod 700 ~pi/.ssh/authorized_keys
chown -R pi:pi ~pi/.ssh

# disable SSH password authenticaion
# from https://stackoverflow.com/questions/20898384/ssh-disable-password-authentication
sed -n 'H;${x;s/\#PasswordAuthentication yes/PasswordAuthentication no/;p;}' /etc/ssh/sshd_config > tmp_sshd_config
cat tmp_sshd_config > /etc/ssh/sshd_config
rm tmp_sshd_config

# reload sshd so the new config is active
service ssh reload

# get latest
apt --yes update
apt --yes upgrade

# install git
apt --yes install git

# config git for user pi
sudo -u pi git config --global user.email "austin@mroczek.org"
sudo -u pi git config --global user.name "austinmroczek"

