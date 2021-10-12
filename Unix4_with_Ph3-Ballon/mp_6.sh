#!/bin/bash

#My Posts

back()
{
echo [G] Go back to My Posts
read choice
case $choice in
[gG])
clear
./mp_6.sh;;
*)
choice=''
clear;;
esac
}

while [ -z "$choice5" ]
do
figlet "My Posts" | lolcat
fullname=$(grep -w  $username sample | cut -f4 -d :)
grep -r "$fullname" /home/server/myposts/mypostslog |nl
grep -r "$fullname" /home/server/myposts/mypostslog |nl > /home/server/myposts/lists
echo [A] Post on wall
echo [R] Refresh wall
echo [N] Next Page
echo [P] Previous Page
echo [G] Go back to Main Menu
echo -n "Choice: "
read choice5
case $choice5 in 
[0-9])
cat /home/server/myposts/lists | grep -w $choice5 > /home/server/myposts/mypostslogfile 
clear
cat /home/server/myposts/mypostslogfile
echo Likes: $(cat /home/server/myposts/likes | wc -l)
echo Hearts: $(cat /home/server/myposts/hearts | wc -l)
echo "(L)Like (H)Heart (C)Comment (G)Go back to My Posts"
echo "[1] View Comments"
echo "[2] View Likes"
echo "[3] View Hearts"
echo -n "Choice: "
read choice6

case $choice6 in
"1")
nl /home/server/myposts/comments
cat /home/server/myposts/personcomment
echo Likes: $(cat /home/server/myposts/likes | wc -l)
echo Hearts: $(cat /home/server/myposts/hearts | wc -l)
echo "(L)Like (H)Heart (D)Delete Comment (G)Go back to Timeline"
read choice6a

case $choice6a in
[lL])
fullname=$(grep -w $username sample | cut -f4 -d :)
if [ -z "$(grep $fullname /home/server/myposts/likes)" ]
then
echo $fullname >> /home/server/myposts/likes
fi
;;
[Hh])
fullname=$(grep -w $username sample | cut -f4 -d :)
if [ -z "$(grep $fullname /home/server/myposts/hearts)" ]
then
echo $fullname >> /home/server/myposts/hearts
fi
;;
[Dd])
rm /home/server/myposts/personcomment
clear
./mp_6.sh
;;
[Gg])
clear
./mp_6.sh;;
*)
choice6a=''
clear;;
esac
;;
"2")
echo Friends who likes this post
cat /home/server/myposts/likes
back;;
"3")
echo Friends who reacted heart to this post
cat /home/server/myposts/hearts
back;;
[lL])
fullname=$(grep -w $username sample | cut -f4 -d :)
if [ -z "$(grep $fullname /home/server/myposts/likes)" ]
then 
echo $fullname >> /home/server/myposts/likes
fi
;;
[hH])
fullname=$(grep -w $username sample | cut -f4 -d :)
if [ -z "$(grep $fullname /home/server/myposts/hearts)" ]
then 
echo $fullname >> /home/server/myposts/hearts
fi;;
[Cc])
echo -n Comment: 
read comment
echo $fullname commented $(date +%T) $comment > /home/server/myposts/personcomment
clear
./mp_6.sh
;;
[gG])
clear 
./mp_6.sh;;
*)
choice6=''
clear;;
esac
;;
[aA])
echo -n "Title of Post: "
read title 

if [ ! -e $title ] 
then 
touch /home/server/myposts/$title && cat > /home/server/myposts/$title && date=$(date +%T) 
clear 
echo -e "$fullname posted $date \t \t $(cat /home/server/myposts/$title)" >> /home/server/myposts/mypostslog

./mp_6.sh
else
clear 
echo "Sorry, that title is already in used." | lolcat 
./mp_6.sh
fi
;;
[rR])
clear
./mp_6.sh
;;
[nN])
;;
[Pp])
;;
[Gg])
clear 
./mp_3.sh;;
*)
choice5=''
clear;;
esac
done


