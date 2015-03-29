#!/bin/bash -x

set -e 
ARCH='x86_64'
VER='F20'
NAME='XSCE'
BUGURL='https://github.com/jvonau/XSCE-builder/issues'

ISOBASE=$VER/$ARCH/os

# gather, createrepo, buildinstall
pungi --nosource --force --nodebuginfo \
    -c xsce-pungi.ks --name "$NAME" \
    --ver="$VER" --bugurl="$BUGURL" \
    -G -C -B

echo "contents for the ISO are at: $ISOBASE"

# Inject KS
cp XSCE-F20.ks $ISOBASE/
# overwrite isolinux.cfg
cp isolinux.cfg $ISOBASE/isolinux/
# overwrite isolinux grub.cfg
cp grub.conf.iso $ISOBASE/isolinux/grub.conf
# overwrite EFI grub.conf
cp grub.conf.efi $ISOBASE/EFI/BOOT/grub.conf

# Compile the iso
pungi --nosource --force  --nodebuginfo \
    -c xsce-pungi.ks --name "$NAME" \
    --ver="$VER" --bugurl="$BUGURL" \
    -I

rm -fr "$ISOBASE/os" "$ISOBASE/debug"
echo ===============================
echo ISO images at $ISOBASE/iso
