repo --name=XSAU-release --baseurl=http://download.laptop.org.au/XS/F11/XS-AU/xsau-release/
repo --name=XSAU-testing --baseurl=http://download.laptop.org.au/XS/F11/XS-AU/bleeding/RPMS/
repo --name=XSAU-ported --baseurl=http://download.laptop.org.au/XS/F11/repo/
repo --name=F11 --mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=fedora-11&arch=i386
repo --name=F11updates --mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=updates-released-f11&arch=i386

%packages --nobase
kernel
kernel-PAE

@core --optional


# School server core services metapackage
@xs-server
@admin-tools
xsau-config
xsau-release
bitfrost
nano
-xs-config
-xs-release
-fedora-release
-fedora-logos
-PackageKit
-gnome-packagekit
-selinux-policy-targeted
# try
-redhat-lsb
-NetworkManager
-perl
-*kde*
-system-config-lvm

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

## missing dep for xs-activation
python-psycopg2

%end

