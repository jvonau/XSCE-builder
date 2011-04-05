#!/bin/bash -x

set -e 
NAME='OLPCAU-XS'
VER='0.7.1'
BUGURL='http://dev.laptop.org.au/'

# "gather, createrepo, buildinstall"
    pungi --nosource --nosplitmedia --force \
    -c olpcxs-pungi.ks --name "$NAME" --nosource \
    --ver="$VER" --bugurl="$BUGURL" \
    --cachedir=/var/cache/pungi -G -C -B

# now the contents for the ISO are at 
ISOBASE=$VER/i386/os

# Inject KS, overwrite isolinux.cfg
cp anaconda-f11.ks $ISOBASE/
cp isolinux.cfg $ISOBASE/isolinux/

# Compile the iso
pungi --nosource --nosplitmedia --force \
    -c olpcxs-pungi.ks --name "$NAME" \
    --ver="$VER" --bugurl="$BUGURL" \
    -I

rm -fr "$ISOBASE/os" "$ISOBASE/debug"
echo ===============================
echo ISO images at $ISOBASE/iso
