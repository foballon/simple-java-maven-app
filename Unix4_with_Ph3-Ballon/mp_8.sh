#!/bin/bash

#My Messages
figlet "My Messages" | lolcat
person=$(grep $username sample | cut -f4 -d :)

while [ -z "$choice8" ]
do 
grep -w "$person" sender | cut -f5 -d : | cat -n 
grep -w "$person" sender | cut -f5 -d : | cat -n > msgs
echo [D] Delete message
echo [G] Go back to Main Menu
echo -n Choice:
read choice8

case $choice8 in
[0-9])
while [ -z "$choice8a" ]
do
cat -n sender | grep -w $choice8 | cut -f4 -d : 
echo [D] Delete Message
echo [G] Go back to My messages
echo -n Choice:
read choice8a
case $choice8a in
[dD])
;;
[gG]) clear 
./mp_8.sh;;
*)
choice8a=''
clear
esac
done
;;

[Dd])

;;
[Gg]) clear 
./mp_3.sh;;
*)
choice8=''
clear;;
esac
done
