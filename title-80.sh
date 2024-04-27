#!/usr/bin/bash
#------------------------------------------------------------------------------#
#                            Programmed By Liz                                 #
#------------------------------------------------------------------------------#
# 80 column title
# now recognizes \n
# now ignores escape sequences
#-------------------------------------------------------------------------------
if [[ $1 == "-h" ]] ||  [[ $1 == "--help" ]]
then
   clear
   title-80.sh "title-80.sh \"example \\\\\\\\n can be used\""
   for typ in "line" "double" "wide" "block1" "block2" "block3" "block4" "c" "c-" "c=" "c/" "c/-" "c/=" "sh" "sh-" "sh="
   do
      title-80.sh -t $typ "title-80.sh -t $typ \"example \\\\\\\\n can be used\""
   done
   exit
fi

if [ $# = 1 ]
then
   msg="$1"
else
   msg="$3"
fi

echo -n > ~/data/title.dat                         # reset title file

wid=80

if (( $# > 1 ))
then
   case $2 in
      "c" | "c+" | "c-" | "c=" | "c/" | "c/-" | "c/=" | "block1" | "block2" | "block3" | "block4" | "wide" )
         wid=78 ;;
   esac
fi

echo -e "$msg" |
while read lin                                     # format text to title file
do
   str=$(echo -e "$lin" | sed 's/\x1B\[[0-9;]\{1,11\}m//g')  # ignore escape sequences
   len=${#str}                                     # true str len
   lft=$((($wid-4-$len)/2))
   rht=$(($wid-4-$len-$lft))
   printf "%"$lft"s%s%"$rht"s\n" "" "$lin" "" >> ~/data/title.dat
done

if [ $# = 1 ]
then
   title.sh
else
   title.sh $1 $2
fi
#-------------------------------------------------------------------------------
