#!/bin/bash

update-alternatives --get-selections | grep -i java |
while read line
do
    alternative=$(echo $line | awk '{print $1}')
    path=$(echo $line | awk '{print $3}')
    newpath=$(echo $path | sed -e "s/$1/$2/")
    if [ -f $newpath ]
    then
      echo "-> update-alternatives --set $alternative $newpath"
      #update-alternatives --set $alternative $newpath
    else
      echo "$alternative unchanged; $newpath does not exist"
    fi
done
