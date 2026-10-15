#!/bin/sh

support/scripts/genimage.sh -c $(dirname $0)/genimage.cfg

rm -f "${BINARIES_DIR}/boot.img.xz"
xz -5 -z "${BINARIES_DIR}/boot.img"

exit $?
