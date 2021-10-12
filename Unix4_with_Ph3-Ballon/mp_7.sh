#!/bin/bash

#My Friends
friends()
{
while [ -z "$choice7" ]
do 
figlet "My Friends" | lolcat
grep -v $username sample | cut -f4 -d : | cat -n 
grep -v $username sample | cut -f4 -d : | cat -n > friends

echo [P] Previous page
echo [N] Next page
echo [G] Go back to Main Menu
echo -n Choice:
read choice7

case $choice7 in
[0-9])
choice7e=$(grep -w $choice7 friends | cut -f2)
grep -w "$choice7e" sample > info;;
[pP])
;;
[nN])
;;
[gG])
clear
./mp_3.sh
;;
*)
choice7=''
clear;;
esac
done
}


disp()
{
figlet "Profile" | lolcat
echo Name: $(echo $(cut -f4 -d : info))
name=$(echo $(cut -f1 -d : info))
echo Phone: $(echo $(cat info1|grep -w $name |cut -f8 -d :))
echo Email address: $(echo $(cut -f6 -d : info))
echo Address: $(echo $(cat info1|grep -w $name|cut -f9 -d :))
echo Birthday: $(echo $(cut -f5 -d : info))
echo Work: $(echo $(cat info1|grep -w $name|cut -f7 -d : ))
echo School: $(echo $(cat info1|grep -w $name|cut -f10 -d : ))
echo About You: $(echo $(cat info1|grep -w $name|cut -f11 -d : ))
}

friends

user=$(grep -w "$username" sample | cut -f4 -d :)
frienduname=$(grep -w "$choice7e" sample | cut -f1 -d :)

if [ -z "$(grep -e "$frienduname: $user" block)" ]
then
while [ -z "$choice7f" ]
do
clear
disp
echo [S] Send Message
echo [G] Go Back
echo -n Choice:
read choice7f

case $choice7f in
[sS])
clear 
export choice7e
./mp_8_send.sh;;
[gG])
clear 
./mp_7.sh;;
*)
choice7f=''
clear;;
esac
done
else
while [ -z "$moveon" ]
do
clear
echo "You can't view $choice7e profile" | lolcat
echo [G] Go back to My Friends
read moveon
case $moveon in
[gG])
clear 
./mp_7.sh;;
*)
moveon=''
clear;;
esac
done
fi
