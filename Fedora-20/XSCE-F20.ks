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
clearpart --drives=sda

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
bootloader --location=mbr --append="rhgb quiet"
clearpart --linux --drives=sda
part /boot --fstype ext3 --size=100 --ondisk=sda
part / --fstype ext3 --size=2048 --maxsize=8192 --grow --ondisk=sda
# size of pv.6 must be at least enough to fit /library size and swap size
part pv.6 --size=1025 --grow --ondisk=sda
volgroup VolGroup00 --pesize=32768 pv.6
# Kickstart raises an error if logvol --size=0
logvol /library --fstype ext3 --name=LogVol00 --vgname=VolGroup00 --size=1 --grow
logvol swap --fstype swap --name=LogVol01 --vgname=VolGroup00 --size=1024 --maxsize=2048 --grow

%packages  --nobase
