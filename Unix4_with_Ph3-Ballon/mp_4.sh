#!/bin/bash

#My Profile

while [ -z $choice4 ]
do
figlet "My Profile" | lolcat
cat sample | grep -w $username > info
echo Name: $(echo $(cat info1 | grep -w $username | cut -f2 -d : ))
echo Phone: $(echo $(cat info1 | grep -w $username | cut -f5 -d : ))
echo Email address: $(echo $(cat info1 | grep -w $username | cut -f4 -d : ))
echo Address: $(echo $(cat info1 | grep -w $username | cut -f6 -d : ))
echo Birthday: $(echo $(cat info1 | grep -w $username | cut -f3 -d : ))
echo Work: $(echo $(cat info1 | grep -w $username | cut -f7 -d :))
echo School: $(echo $(cat info1 | grep -w $username | cut -f8 -d :))
echo About You: $(echo $(cat info1 | grep -w $username | cut -f9 -d : ))

echo -e \\n"(E) Edit Information"
echo "(G) Go back"
echo -en \\n"Enter choice: "
read choice4

save(){
while [ -z "$choice4a" ]
do
echo -e \\n"[1] Submit/Save changes"
echo "[2] Cancel"
echo -n "Choice: "
read choice4a

case $choice4a in
"1")
echo $username:$fullname:$birthdate:$email:$phone:$address:$work:$school:$about >> info1
./mp_4.sh;;
"2")
clear 
./mp_4.sh;;
*)
choice4a=''
clear;;

esac
done
}


case $choice4 in
[eE])
while [ -z "$choice4e" ]
do
   clear
figlet "Edit Info" | lolcat
echo What do you want to edit?
echo -e \\n[1] Name: $(echo $(cat info1 | grep -w $username | cut -f2 -d :))
echo [2] Phone: $(echo $(cat info1| grep -w $username | cut -f5 -d : ))
echo [3] Email address: $(echo $(cat info1 | grep -w $username | cut -f4 -d : ))
echo [4] Address: $(echo $(cat info1 | grep -w $username | cut -f6 -d : ))
echo [5] Birthday: $(echo $(cat info1 | grep -w $username | cut -f3 -d : ))
echo [6] Work: $(echo $(cat info1|grep -w $username|cut -f7 -d : ))
echo [7] School: $(echo $(cat info1 | grep -w $username|cut -f8 -d : ))
echo [8] About You: $(echo $(cat info1 | grep -w $username|cut -f9 -d : ))
echo "[9] Cancel"
echo -en \\n"Enter choice: "
read choice4e
case $choice4e in
"1")
echo -n Name:
read fullname
save
;;
"2")
echo -n Phone:
read phone
save
;;
"3")
echo -n Email address: 
read email
save
;;
"4")
echo -n Address:
read address
save;;
"5")
echo -n Birthday:
read birthdate
save
;;
"6")
echo -n Work:
read work
save;;
"7")
echo -n School:
read school
save;;
"8")
echo -n "About You: "
read about
save;;
"9")
clear 
./mp_4.sh;;
*)
choice4e=''
clear;;
esac
done
;;
[gG])
   clear 
   ./mp_3.sh;;
*)
   choice4=''
   clear;;
esac
done
