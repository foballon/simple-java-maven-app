#!/bin/bash

#Registration
figlet "Registration"|lolcat

let counter=1
if [[ $uid -eq $counter ]] 
then 
counter=$(echo $(($counter+1)))
else 
echo $counter
fi

#Username
echo -e \\n"*NOTE: Username must be at least 8 characters,\\nbegin with an alphabetic character and unique"
echo -en \\n"a. Enter username: "
read username 
noOfChara=$(echo $username | wc -m)

#a.a username length
until ((noOfChara >= 9))
do 
clear
   echo -e \\n"Error! Must be at least 8 characters" | lolcat
   echo -en \\n"Enter username: " 
   read username
   noOfChara=$(echo $username | wc -m)
done

#a.b username first character
while [ -z "$(echo $username | grep ^[[:alpha:]@])" ]
do
   echo -e \\n"Error! Must begin with an alphabetic character or an @ symbol" | lolcat
echo -en \\n"Enter username: "
read username
done

checku=$(cut -f1 -d : sample | grep -w $username)
if [ ! -z "$checku" ]
then
clear
echo -e \\n"Sorry, that username is already in used." | lolcat
./mp_2.sh
fi

#Password

enterpass()
{
echo -n "Enter password: "
read -s password
}

reEnter()
{
   echo -n "Enter password: "
   read -s password
   echo -en \\"Re-enter password: "
   read -s repassword
   if [ "$password" == "$repassword" ]
   then
     echo 
   else 
     echo "Passwords did not match"
     repass 
   fi
}

echo -e \\n"*NOTE: Password must be at least 8 charactera,\\ncontain at least 1 alphabetic character, digit or punctuation mark\\nand not similar with the username"
echo -en \\n"b. Enter Password: "
read -s password 
noOfCharb=$(echo $password | wc -m)
#echo -en \\n"Re-enter Password: "
#read -s repassword

#b.a password length
until ((noOfCharb >= 9))
do 
   echo -e \\n"Error! Must be at least 8 characters" | lolcat
   echo -en \\n"Enter password: "
   read -s password
   noOfCharb=$(echo $password | wc -m)
done

#b.b Must contain 1 lower, 1 upper, 1 digit and 1 punct
while [ -z "$(echo $password | grep [[:lower:]])" ]
do
   echo -e \\n"Error! Must contain  at least 1 lower case" | lolcat
   echo -e \\n"*NOTE: Password must be at least 8 charactera,\\ncontain at least 1 lower case, 1 upper case alphabetic character, 1 digit and  punctuation mark\\nand not similar with the username"
enterpass
done

while [ -z "$(echo $password | grep [[:upper:]])" ]
do
   echo -e \\n"Error! Must contain at least 1 upper case" | lolcat
   echo -e \\n"*NOTE: Password must be at least 8 charactera,\\ncontain at least 1 lower case, 1 upper case alphabetic character, 1 digit and  punctuation mark\\nand not similar with the username"
enterpass
done

while [ -z "$(echo $password | grep [0-9])" ]
do
   echo -e \\n"Error! Must contain at least 1 digit" | lolcat
   echo -e \\n"*NOTE: Password must be at least 8 charactera,\\ncontain at least 1 lower case, 1 upper case alphabetic character, 1 digit and  punctuation mark\\nand not similar with the username"
   echo -en \\n"Enter password: "
   read -s password
done

while [ -z "$(echo $password | grep [[:punct:]])" ]
do
   echo -e \\n"Error! Must contain at least 1 punctuation mark"| lolcat
   echo -e \\n"*NOTE: Password must be at least 8 charactera,\\ncontain at least 1 lower case, 1 upper case alphabetic character, 1 digit and  punctuation mark\\nand not similar with the username"
   enterpass
done

#b.c password must not be similar with the username 
while [ "$password" == "$username" ]
do
   echo -e \\n"Error! Must not be similar with username" | lolcat
   echo -en \\n"Enter password: "
   read -s password
done

echo -en \\n"Re-enter Password: "
read -s repassword

#b.d 
while [ "$password" != "$repassword" ]
do
   echo -e \\n"Error! Passwords did not match" | lolcat
   echo -en \\n"Enter password: "
   read -s password
   echo -en \\n"Re-enter password: "
   read -s repassword
done

echo -e \\n"c. Fullname(First name, Middle Name, Lastname)"
read fullname
while [ -z "$fullname" ]
do 
   echo -e \\n"Must enter fullname" | lolcat
   echo "Enter fullname(First name, Middle name, Lastname): "
   read fullname
done

echo -en \\n"d. Enter Birthdate(MM/DD/YYYY): "
read birthdate

while [ -z "$birthdate" ]
do 
   echo -e \\n"Must enter birthdate" | lolcat
   echo -n "Enter Birthdate((MM/DD/YYYY): "
   read birthdate
done
  
echo -en \\n"e. Enter Email address: "
read email

while [ -z "$email" ]
do
   echo -e \\n"Must enter email address" | lolcat
   echo -n "Enter Email address: "
   read email
done

uidnum

clear
echo -e \\n"a. Username: $(echo $username)"
echo "b. Password: "
echo "c. Full name(First name, Middle name, Last name)" 
echo "  " $(echo $fullname)
echo "d. Birthdate(MM/DD/YYYY): $(echo $birthdate)"
echo "e. Email address: $(echo $email)"

echo -e \\n"[1] Submit/Save changes"
echo "[2] Cancel"

echo -n "Enter your choice: "
read choice2
 
case $choice2 in
"2")
   clear
   ./mp_1.sh;;
"1")
 #  ./mp_2_uid.sh
   echo $username:$uid:x:$fullname:$birthdate:$email >> sample
echo $username:$fullname:$birthdate:$email >> info1
nl sample 
   echo $username:$password >> mp_1_checku
clear
./mp_1.sh;;
"*")
   choice2=''
   clear;;
esac

