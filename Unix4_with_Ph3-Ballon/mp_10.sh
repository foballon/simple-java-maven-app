#!/bin/bash

#Settings

while [ -z "$setchoice" ]
do
figlet "Settings" | lolcat
echo "[a] Privacy Settings"
echo [b] Account Settings
echo [c] Un/Blocking
echo [g] Go back to Main Menu
echo -n Choice: 
read setchoice

case $setchoice in
[aA])
while [ -z "$prichoice" ]
do
clear
figlet "Privacy" | lolcat 
echo "[a] Your Friends"
echo [b] Your Group 
echo [c] Only Me
echo [g] Go back to Settings
echo -n Choice: 
read prichoice

case $prichoice in
[aA])
clear
./mp_7.sh;;
[bB]) 
clear 
./mp_9.sh;;
[cC])
;;
[gG])
clear
./mp_10.sh;;
*)
prichoice=''
clear;;
esac
done
;;
[bB])
while [ -z "$account" ]
do
clear
figlet "Account" | lolcat
echo "[1] Change Password"
echo [2] Deactivate Account
echo [G] Go back to Settings
echo -n Choice:
read account

case $account in
"1")
echo -n New Password:
read newpass
sed -i "s/$(grep -w $username mp_1_checku | cut -f2 -d : )/$newpass/g" mp_1_checku
clear
./mp_10.sh
;;
"2")
sed -i "s/$(grep -w $username mp_1_checku | cut -f1 -d :)/*/g" mp_1_checku
clear
./mp_1.sh
;;
[gG])
clear
./mp_10.sh;;
*)
account=''
clear;;
esac
done
;;
[cC])
while [ -z "$block" ]
do
clear
figlet "Un/Blocking" | lolcat
echo "[1] Block"
echo [2] Unblock
echo [C] Cancel
echo -n Choice: 
read block

case $block in
"1")
while [ -z "$blockperson" ]
do
clear
figlet "Block" | lolcat
cat friends
echo -n Block Person:
read blockperson
done

echo $username:$(cat friends | grep -w $blockperson | tr "$blockperson" " ") >> block

clear
./mp_10.sh
;;
"2")
while [ -z "$unblock" ]
do
clear
figlet "Unblock" | lolcat
echo "Friend/s you've block"
grep -w $username block | cut -f2 -d : | cat -n 
grep -w $username block | cut -f2 -d : | cat -n > ublock
echo -n Unblock Person:
read unblock

case $unblock in
[0-9])
choice7e=$(grep -w $unblock ublock | cut -f2)
sed -i "s/$choice7e/ /g" block
clear 
./mp_10.sh
;;
*)
unblock=''
clear;;
esac
done
;;
[cC])
clear 
./mp_10.sh;;
*)
block=''
clear;;
esac
done
;;
[gG])
clear
./mp_3.sh
;;
*)
setchoice=''
clear
;;
esac
done
