#!/bin/bash
#Myat Thit Ko Ko
#Creating Directories and Files

echo -n "Enter a name for a new directory. "
read DirName
mkdir $DirName
cd $DirName

mkdir dir1
echo This is file 1. > f1
echo This is file 2. > dir1/f2
echo This is file 3. > dir1/f3
echo All files have been created.

echo -n "f1: "
cat f1

echo -n "f2: "
cat dir1/f2

echo -n "f3: "
cat dir1/f3