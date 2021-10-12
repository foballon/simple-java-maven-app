#!/bin/bash 

#Login

while [[ -z "$choice1" ]]
do
figlet "Welcome!" | boxes -d dog -a hc | lolcat
echo "[1] Login"
echo "[2] Sign Up"
echo "[3] Exit"

echo -n "Enter your choice: "
read choice1

case $choice1 in
"1")
   ./mp_1_loginChoice.sh;;
"2")
clear
   ./mp_2.sh
   ;;
"3")
   exit 
;;
*)
   choice1=''
   clear;;
esac
done

