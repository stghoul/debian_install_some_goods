#!/bin/sh

#enabling root ssh login
sed -i "s/.*PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config
service sshd restart

#creating /etc/rc.local
curl https://raw.githubusercontent.com/stghoul/debian_install_some_goods/main/rc-local.service?token=AVIA6BWBG4ZYRXQS3GK5RP3BEP2E2 --output /etc/systemd/system/rc-local.service
curl https://raw.githubusercontent.com/stghoul/debian_install_some_goods/main/rc.local?token=AVIA6BU7PQA6YO7AAVNT2YLBEP2GI --output /etc/rc.local
chmod +x /etc/rc.local
systemctl enable rc-local
systemctl start rc-local

#installing some useful stuff
apt update
apt install -y wget sudo
