#!/bin/bash

while [ -z "$choice9" ]
do
figlet "My Groups" | lolcat
 
echo "a. Create a Group"
echo "b. View Group"
echo "c. Edit a Group"
echo "d. Delete a Group"
echo "g. Go Back to Main Menu"
echo -n "Choice: "
read choice9

case $choice9 in 
[aA])

creategroup(){
while [ -z "$groupname" ]
do
clear
figlet "Create Group" | lolcat
echo -n "Name of the Group: "
read groupname

done
}

while [ -z "$choice9a" ]
do
clear
creategroup
echo "[1] Create"
echo [2] Cancel
echo -n Choice: 
read choice9a

case $choice9a in
"1")
admin=$username
groupadd $groupname

while [ -z "$choice9b" ]
do
echo "[1] Add Member"
echo [2] Go back to My Groups
echo -n Choice:
read choice9b

case $choice9b in
"1")
clear
figlet "Add Member" | lolcat
cat -n friends
echo -n Select friend to add to group: 
read arr
member=$(grep -w $arr friends | tr "$arr" " ")

if [ -z "$(grep $member mp_9_groupadmin)" ]
then
echo $admin:$groupname:$member >> mp_9_groupadmin
else
echo "Already a member of the group" 
fi 

clear
./mp_9.sh
;;
"2")
clear 
./mp_9.sh;;
*)
choice9b=''
clear;;
esac
done
;;
"2") 
clear 
./mp_9.sh;;
*) 
choice9a=''
clear;;
esac
done
;;
[bB])
clear
figlet "View Group" | lolcat
echo -n "Group Name: "
read viewg 
checkg=$(grep -w "$viewg" /etc/group)

if [ -z "$checkg" ]
then
clear && echo "Group does not exist" | lolcat && ./mp_9.sh
else
figlet "$viewg" | lolcat && echo "Members of this Group" &&
cat mp_9_groupadmin | grep -w "$viewg" | cut -f3 -d: > mp_9_groupmembers
cat -n mp_9_groupmembers
fi

;;
[cC])
clear
figlet "Edit Group" | lolcat
echo $admin
grep -w "$admin" mp_9_groupadmin > mp_9_admingroups
cat mp_9_admingroups | cut -f2 -d : | cat -n

echo -e \\n"[1-9] Select Group to Edit"
echo "[G] Go back to My Groups"
echo -n "Choice: "
read editg 

case $editg in
[1-9])
echo "[1] Add Member"
echo [2] Remove Member
echo -n Choice:
read addrem

case $addrem in
"1")
clear
figlet "Add Member" | lolcat
cat friends
echo -n Select friend to add to group: 
read arr
member=$(grep -w $arr friends | tr "$arr" " ")

if [ -z "$(grep $member mp_9_groupadmin)" ]
then
echo $admin:$groupname:$member >> mp_9_groupadmin
else
echo "Already a member of the group" 
fi ;;

"2")
;;
*)
addrem=''
clear;;
esac
;;
[gG])
clear
./mp_9.sh;;
esac
;;
[dD])
clear
figlet "Delete Group" | lolcat
echo $admin
grep -w "$admin" mp_9_groupadmin > mp_9_admingroups
cat mp_9_admingroups | cut -f2 -d : | cat -n 

echo -e \\n"[1-9] Select Group to Delete"
echo [G] Go back to My Groups
echo -n Choice:
read del
gname=$(cat -n mp_9_admingroups | grep -w "$del" | tr "$del" " " | cut -f2 -d :) 
case $del in
[1-9])
echo -e \\n"[1] Delete Group"
echo [2] Cancel
echo -n Choice:
read choicedel

case $choicedel in
"1") 
groupdel $gname

clear
./mp_9.sh
;;
"2")
clear
./mp_9.sh;;
esac
;;
[gG])
clear
./mp_9.sh;;
esac
;;
[gG])
clear
./mp_3.sh
;;
*)
choice9=''
clear
;;
esac
done
