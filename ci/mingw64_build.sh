#!/bin/sh -e

SELF_BIN=$(realpath ${0})
SELF_DIR=$(dirname ${SELF_BIN})

cd ${SELF_DIR}/..
if [ -d build ]; then
    rm -rf build
fi

mkdir build
cd build

echo building_started..
cmake ../src
cmake --build .

echo building_finished..
