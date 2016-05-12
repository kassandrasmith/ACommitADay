#!/bin/bash
committedToday=false;
#find all git repositories and put them into this text file

# find ~ -name .git -type d -prune 2>/dev/null  > RepositoryDirectory.txt
#
# #add globbers for files with a newline
# awk '{gsub(/ /,"\\ ")}8' RepositoryDirectory.txt > gits.txt

#Don't break on whitespaces
IFS=''
cat ~/goodgits.txt |
(while read data
do

cd #not necessary, but a safeguard to get to root
  cd $data;
  cd .. #compensate for .git at end of line
  DATE=$(date +%Y-%m-%d) &> /dev/null #Silence date output
  LOG_DATE=$(git log -1 HEAD --pretty=format:"%cd" --date=short)
  StartDate=$(date -u -d "$DATE" +"%s")
  FinalDate=$(date -u -d "$LOG_DATE" +"%s")
  if [[ "$StartDate" -eq "$FinalDate" ]];
  then
          committedToday=true;
   fi;
done


if [ "$committedToday" = false ] ; then
    #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!#
    echo "You still need to commit!"; #feel free to change me!
  else
    #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!#
    echo "You've committed today."; #feel free to change me!
fi
)
