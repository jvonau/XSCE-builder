###
###  Kickstart file for OLPC XS School Server software
###

### Make it interactive - so these are 'seed' values
interactive

# Provide some defaults
lang en_US.UTF-8
auth --useshadow --enablemd5
selinux --disabled
# network --device eth0 --bootproto dhcp --hostname schoolserver

#  We enable the firewall, even though we are going to overwrite
#  what anaconda leaves behind
firewall --disabled

### X?
#skipx

## Enable/Disable some services up front
services --enabled=NetworkManager,sshd,avahi-daemon

###
### disk partitioning...
###
# clear out sda without qualms...
#clearpart --drives=sda

# Small Disk Support:       (xs #7241)
# If space >~10GiB then the sizes are
#       /boot       100 MiB
#       /             8 GiB
#       swap          2 GiB
#       /library    fills all remaining capicity
# If space is limited, partition sizes are reduced.
# Smallest supported capacity is ~5GiB when no livecd-creator --uncompressed-size argument is
# specified (defaults to 4096).
# Using livecd-creator --uncompressed-size=2048 allows installation on ~3GiB disks (not tested yet).
#bootloader --location=mbr --append="rhgb quiet"
#clearpart --linux --drives=sda
#part /boot --fstype ext3 --size=100 --ondisk=sda
#part / --fstype ext3 --size=2048 --maxsize=8192 --grow --ondisk=sda
# size of pv.6 must be at least enough to fit /library size and swap size
#part pv.6 --size=1025 --grow --ondisk=sda
#volgroup VolGroup00 --pesize=32768 pv.6
# Kickstart raises an error if logvol --size=0
#logvol /library --fstype ext3 --name=LogVol00 --vgname=VolGroup00 --size=1 --grow
#logvol swap --fstype swap --name=LogVol01 --vgname=VolGroup00 --size=1024 --maxsize=2048 --grow

%packages  --nobase
kernel
@core --optional

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
