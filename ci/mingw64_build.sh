#!/bin/sh -e

SELF_BIN=$(realpath ${0})
SELF_DIR=$(dirname ${SELF_BIN})

cd ${SELF_DIR}/..
cd src
echo Clear the old generated files..
make -f Makefile.in clean-windows-mac
echo Generate the new files..
cp include/win-mac.h include/autoconf.h
cp include/osconf.hin include/osconf.h
make -f Makefile.in prep-windows
rm Makefile

cd ${SELF_DIR}/..
if [ -d build ]; then
    rm -rf build
fi

mkdir build
cd build

echo Building_started..
cmake ../src
cmake --build .

echo Building_finished..
