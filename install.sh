#! /bin/sh
# /opt/bitnami/apps/wordpress/bnconfig --disable_banner 1
# /opt/bitnami/ctlscript.sh restart apache

# themes=/opt/bitnami/apps/redmine/htdocs/public/themes
# git clone https://github.com/akabekobeko/redmine-theme-minimalflat.git $theme/minimalflat
# git clone https://github.com/pixel-cookers/redmine-theme.git $theme/pixel-cookers
# git clone https://github.com/Nitrino/flatly_light_redmine.git $theme/flatly_light

sed -i.bak "s/iface eth0 inet dhcp/iface eth0 inet static\naddress 192.168.1.159\nnetmask 255.255.255.0\ngateway 192.168.1.111/" /etc/network/interfaces
