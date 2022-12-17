#!/bin/bash

#enabling root ssh login
sed -i "s/.*PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config
service sshd restart

#creating /etc/rc.local
wget https://raw.githubusercontent.com/stghoul/debian_install_some_goods/main/rc-local.service --output-document=/etc/systemd/system/rc-local.service
wget https://raw.githubusercontent.com/stghoul/debian_install_some_goods/main/rc.local --output-document=/etc/rc.local
chmod +x /etc/rc.local
systemctl enable rc-local
systemctl start rc-local

#installing some useful stuff
apt update
apt upgrade -y
apt install -y curl sudo net-tools gnupg apt-transport-https
curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-bullseye-prod bullseye main" > /etc/apt/sources.list.d/microsoft.list'
apt update
apt install -y powershell
