#!/bin/bash

#mp_1.sh [1] Login Choice

#login username

clear
cowsay -f dragon "Welcome my Khal/Khaleesi" | lolcat
echo Login
echo -n "Enter username: "
read username

while [ -z "$username" ]
do 
clear
echo Login
cowsay -f dragon "Welcome my Khal/Khaleesi" | lolcat
   echo -e \\n"Must enter username" | lolcat
   echo -n "Enter username: "
   read username
done

#login password

echo -n "Enter password: "
read -s password

while [ -z "$password" ]
do 
   echo -e \\n"Must enter password" | lolcat
   echo -n "Enter password: "
   read -s password
done

nr()
{
echo -e \\n"You're not registered" | lolcat
while [[ -z "$choice1l" ]]
do
echo "[1] Sign Up"
echo "[2] Exit"
echo -n "Enter your choice: "
read choice1l
case $choice1l in 
"1")
clear && ./mp_2.sh;;
"2")
clear && ./mp_1.sh;;
*)
choice1l=''
clear;;
esac
done
}

checku=$(cut -f1 -d : mp_1_checku | grep -w $username)

if [ -z "$checku" ]
then
   nr
fi

checkpw=$(cut -f2 -d : mp_1_checku | grep -w $password)

if [ -z "$checkpw" ]
then
clear
   echo -e \\n"The password you've entered is incorrect" | lolcat
   ./mp_1.sh
else 
  clear
export username
  ./mp_3.sh
./mp_4.sh
./mp_5.sh
./mp_6.sh
./mp_7.sh
./mp_8.sh
./mp_8_send.sh
./mp_9.sh
./mp_10.sh
fi

