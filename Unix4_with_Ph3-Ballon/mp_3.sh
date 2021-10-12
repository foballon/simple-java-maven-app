#!/bin/bash


while [[ -z "$choice" ]]
do
fortune | cowsay -f kitty | lolcat
echo $username 
echo "Main Menu"
echo "a. My Profile""    "$(echo c. My Friends)"    "$(echo e. My Groups)"    "$(echo g. Settings)
echo "b. My Timeline""   "$(echo d. My Messages)"   "$(echo f. My Posts)"     "$(echo h. Logout)

echo -n "Enter your choice: " 
read choice

case $choice in
[aA]) 
        clear
	./mp_4.sh;;
[Bb])
clear
./mp_5.sh;;
[Cc])
clear 
./mp_7.sh
;;
[Dd]) 
	clear
./mp_8.sh
 ;;
[Ee]) 
clear
./mp_9.sh
;;
[Ff])
clear
 ./mp_6.sh;;
[Gg])
clear
./mp_10.sh
;;
[Hh])
        clear 
	./mp_1.sh;; 
*)
	choice=''
        clear;;
esac
done

