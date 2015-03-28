#!/bin/bash -x

set -e 
NAME='F20XSCE'
VER='alpha'
BUGURL='https://github.com/jvonau/XSCE-builder/issues'

# gather, createrepo, buildinstall
pungi --nosource --force \
    -c xsce-pungi.ks --name "$NAME" \
    --ver="$VER" --bugurl="$BUGURL" \
    -G -C -B

# now the contents for the ISO are at 
ISOBASE=$VER/i386/os

# Inject KS, overwrite isolinux.cfg
cp XSCE-F20.ks $ISOBASE/
cp isolinux.cfg $ISOBASE/isolinux/

# Compile the iso
pungi --nosource --force \
    -c olpcxs-pungi.ks --name "$NAME" \
    --ver="$VER" --bugurl="$BUGURL" \
    -I

rm -fr "$ISOBASE/os" "$ISOBASE/debug"
echo ===============================
echo ISO images at $ISOBASE/iso
