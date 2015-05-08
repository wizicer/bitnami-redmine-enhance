#! /bin/sh
/opt/bitnami/apps/wordpress/bnconfig --disable_banner 1
/opt/bitnami/ctlscript.sh restart apache

