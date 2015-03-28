#!/bin/bash -x

set -e 
NAME='F20XSCE'
VER='alpha'
BUGURL='https://github.com/jvonau/XSCE-builder/issues'

# gather, createrepo, buildinstall
echo pungi --nosource --nosplitmedia --force \
    -c xsce-pungi --name "$NAME" \
    --ver="$VER" --bugurl="$BUGURL" \
    -G -C -B

# now the contents for the ISO are at 
ISOBASE=$VER/i386/os

# Inject KS, overwrite isolinux.cfg
cp olpcxs-07.ks $ISOBASE/
cp isolinux.cfg $ISOBASE/isolinux/

# Compile the iso
pungi --nosource --nosplitmedia --force \
    -c olpcxs-pungi.ks --name "$NAME" \
    --ver="$VER" --bugurl="$BUGURL" \
    -I

rm -fr "$ISOBASE/os" "$ISOBASE/debug"
echo ===============================
echo ISO images at $ISOBASE/iso
