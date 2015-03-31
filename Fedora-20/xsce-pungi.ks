repo --name=fedora --mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=fedora-20&arch=$basearch 
repo --name=fedora-updates --mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=updates-released-f20&arch=$basearch 
repo --name=xs-extra --baseurl=http://download.unleashkids.org/xsce/repos/xs-extra
repo --name=xsce-extra --baseurl=http://download.unleashkids.org/xsce/repos/xsce-extra
repo --name=xsce-testing --baseurl=http://download.unleashkids.org/xsce/repos/xsce/testing


#### order of appearence in fedora-install-fedora.ks
%packages --default --nobase
-kernel*debug*
-kernel-kdump*
-kernel-tools*
kernel*
dracut-*

@standard
@core --optional
@dial-up
@hardware-support

@web-server
@php
@python-web
@sql-server

@anaconda-tools
-PackageKit-zif
-zif

##### /end
## safe
grub2

# this is going to be the olpc-xs group
#xs-ejabberd
#xs-rsync
olpc-contents
bitfrost
mtd-utils

### xs-special
#xs-otp
#pam_otp
ds-backup-server
idmgr
usbmount
xs-rsync
ejabberd-2.1.11-5.1.fc17.XSCE
ds-backup-server
moodle-xs

# straight stuff
acpid
active-document
avahi
avahi-tools
avahi-ui
bash
bind
bind-utils
bzip2
cadaver
chrony
couchdb
createrepo
curl
dansguardian
dhcp
etckeeper
expect
gcc
gcc-c++
htop
httpd
idmgr
incron
iptables
iptables-services
libxslt-devel
logrotate
lynx
make
mariadb
mariadb-server
mlocate
mod_authnz_external
mod_ssl
mod_wsgi
mod_xsendfile
monit
munin
munin-node
mysql-connector-python
MySQL-python
nano
net-tools
NetworkManager
nodejs
npm
nss-mdns
openssh-server
openvpn
owncloud
php
php-devel
php-gd
php-imap
php-ldap
php-odbc
php-pear
php-xml
php-xmlrpc
postgresql
postgresql-server
pwauth
pyOpenSSL
python-daemon
python-devel
python-gunicorn
#python-imaging
python-passlib
python-pip
python-psutil
python-psycopg2
python-sqlalchemy
python-virtualenv
python-xappy
restful-document
rrdtool-python
rsync
screen
squid
sudo
tar
unzip
vim-minimal
vnstat
wget
xinetd
xml-common
xz-devel
yum-utils
zeromq3-devel

%end
