#! /bin/bash 

while read line

do
ping -c 4 $line
done < ./slither.srv.list
