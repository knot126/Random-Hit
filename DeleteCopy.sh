#!/bin/bash

echo "Input the path to your CLEAN apk root:"
read RRCPATH

echo "Delete files from $RRCPATH..."
rm -rv $RRCPATH/assets
rm -rv $RRCPATH/res
rm -rv $RRCPATH/AndroidManifest.xml

echo "Copy files to $RRCPATH..."
cp -rv ./assets $RRCPATH
cp -rv ./res $RRCPATH
cp -rv ./AndroidManifest.xml $RRCPATH

echo ""
echo "If you would like to prepare for a game modes build, then edit the files"
echo "in $RRCPATH to do so."
