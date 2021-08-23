#!/bin/bash

#enabling root ssh login
sed -i "s/.*PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config
service sshd restart

#creating /etc/rc.local
wget https://raw.githubusercontent.com/stghoul/debian_install_some_goods/main/rc-local.service --output=/etc/systemd/system/rc-local.service
wget https://raw.githubusercontent.com/stghoul/debian_install_some_goods/main/rc.local --output=/etc/rc.local
chmod +x /etc/rc.local
systemctl enable rc-local
systemctl start rc-local

#installing some useful stuff
apt update
apt install -y wget sudo