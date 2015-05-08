#! /bin/sh

/opt/bitnami/apps/redmine/bnconfig --disable_banner 1
# /opt/bitnami/ctlscript.sh restart apache

themes=/opt/bitnami/apps/redmine/htdocs/public/themes
git clone https://github.com/akabekobeko/redmine-theme-minimalflat.git $themes/minimalflat
git clone https://github.com/pixel-cookers/redmine-theme.git $themes/pixel-cookers
git clone https://github.com/Nitrino/flatly_light_redmine.git $themes/flatly_light
git clone https://github.com/rubo77/freifunk-red-andy.git $themes/red-andy

mv /etc/init/ssh.conf.back /etc/init/ssh.conf
start ssh

sed -i.bak "s/iface eth0 inet dhcp/iface eth0 inet static\naddress 192.168.1.159\nnetmask 255.255.255.0\ngateway 192.168.1.111/\ndns-nameservers 192.168.1.111" /etc/network/interfaces
reboot
