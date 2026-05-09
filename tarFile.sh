#!/bin/bash
#Myat Thit Ko Ko
#Creating a tar file.

echo -n "Enter a directory name. "
read DirName
echo -n "Enter a tar file name. "
read TARfile
tar cf $TARfile $DirName
echo Files in $TARfile
tar tf $TARfile
gzip $TARfile