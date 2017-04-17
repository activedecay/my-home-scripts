#!/bin/bash

cat $1 | egrep "^jre|^jdk|^plugin|^hl" | 
while read input; do
  #echo $input
  eval set -- "$input"; 
  which $2
  if [ $? -eq 0 ]; then 
    link=`which $2`
    name=$2
    path=$3
    #todo does not handle slaves (man pages are a good candidate for slaves)
    echo sudo update-alternatives --install $link $name $path 1
    #if [ $1 == "jre" ]; then dir=jre; elif [ $1 == "jdk" ]; then dir=bin; else dir=; fi
    #echo $1 $2 `find /usr/lib/jvm/java-7-oracle-x86/$dir -name $2`
  else 
    echo "didnot find $2"
  fi 
done
