#!/bin/bash -x

set -e 
ARCH='x86_64'
VER='F20'
NAME='$VERXSCE'
BUGURL='https://github.com/jvonau/XSCE-builder/issues'

ISOBASE=$VER/$ARCH/os

# gather, createrepo, buildinstall
pungi --nosource --force \
    -c xsce-pungi.ks --name "$NAME" \
    --ver="$VER" --bugurl="$BUGURL" \
    -G -C -B

echo "contents for the ISO are at: $ISOBASE"

# Inject KS
cp XSCE-F20.ks $ISOBASE/
# overwrite isolinux.cfg
cp isolinux.cfg $ISOBASE/isolinux/

# Compile the iso
pungi --nosource --force \
    -c xsce-pungi.ks --name "$NAME" \
    --ver="$VER" --bugurl="$BUGURL" \
    -I

rm -fr "$ISOBASE/os" "$ISOBASE/debug"
echo ===============================
echo ISO images at $ISOBASE/iso
