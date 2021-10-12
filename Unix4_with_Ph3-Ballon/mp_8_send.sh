#!/bin/bash

#Send Message

while [ -z "$choice8send" ]
do
figlet "Message" | lolcat
echo -n Message: 
read msg

fullname=$(grep $username sample | cut -f4 -d :)

echo [S] Send
echo [C] Cancel
echo -n Choice: 
read choice8send

case $choice8send in
[sS])
date=$(date +%T)
echo $username:$choice7e::$msg:$fullname:$date >> sender
clear
./mp_7.sh;;
[cC]) 
clear 
./mp_7.sh;;
*)
choice8send=''
clear
esac
done
