#!/bin/bash

echo -n "Enter command name: "
read cmd

echo -n "Enter option to search: "
read opt

echo

man $cmd >/dev/null && man $cmd | egrep --color=always -A 2 ' \'$opt', ' || echo "Not found"
