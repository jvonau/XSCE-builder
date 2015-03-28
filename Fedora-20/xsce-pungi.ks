repo --name=fedora --mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=fedora-20&arch=$basearch 
repo --name=fedora-updates --mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=updates-released-f20&arch=$basearch 
repo --name=xs-extra --baseurl=http://download.unleashkids.org/xsce/repos/xs-extra
repo --name=xsce-extra --baseurl=http://download.unleashkids.org/xsce/repos/xsce-extra
repo --name=xsce-testing --baseurl=http://download.unleashkids.org/xsce/repos/xsce/testing


%packages
kernel

@core --optional

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
#xs-otp
#pam_otp
#ds-backup-server
idmgr
usbmount

# straight stuff
ansible
python-pip
etckeeper
puppet
dnsmasq
php
php-cli
php-pecl*
php-pgsql
httpd
httpd-tools

%end
