#!/bin/bash

cd .build/checkouts/gir2swift
echo "About to build gir2swift in `pwd`"
swift build
cd ../../..

echo "Generating: `pwd`"
.build/checkouts/gir2swift/.build/debug/gir2swift

for DIR in `ls -d .build/checkouts/Swift*/ | grep -v XML`
do
    cd $DIR
    echo "Generating: `pwd`"
    ../gir2swift/.build/debug/gir2swift
    cd ../../..
done
