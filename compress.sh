#!/bin/sh
version=$1;
file_name=mpc-dart-$version
[ -d $file_name ] && rm -rf $file_name
mkdir $file_name
cp -R android/src/main/jniLibs $file_name
cp ios/libmpc.a $file_name
zip -r $file_name.zip $file_name
rm -rf $file_name
