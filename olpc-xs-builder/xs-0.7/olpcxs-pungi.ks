repo --name=fedora --mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=fedora-14&arch=$basearch 
#--ignoregroups=true
repo --name=fedora-updates --mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=updates-released-f14&arch=$basearch 
#--ignoregroups=true
#repo --name=comps --baseurl=file:///home/martin/src/xs-livecd/f14

%packages
kernel
kernel-PAE

@base --optional
@console-internet --optional
@core --optional
@network-tools --optional
#@perl --optional
@postgresql --optional

# this is going to be the olpc-xs group
postgresql-server
#xs-ejabberd
ejabberd
#xs-rsync
rsync
olpc-contents
bitfrost

### xs-special
#xs-config
#xs-logos
#xs-release
#ds-backup-server
#idmgr
#usbmount
xs-otp
pam_otp

# straight stuff
etckeeper
puppet
dnsmasq
php
php-cli
php-pecl-apc
php-pgsql
httpd
httpd-tools
mod_python

# try
-NetworkManager
-perl
%end
