#!/bin/bash
committedToday=false;
#find all git repositories and put them into this text file
# find ~ -name .git -type d -prune 2>/dev/null  > RepositoryDirectory.txt

#add globbers for files with a newline
awk '{gsub(/ /,"\\ ")}8' RepositoryDirectory.txt > gits.txt

#Don't break on whitespaces
IFS=''
cat gits.txt |
(while read data
do

cd #not necessary, but a safeguard to get to root
  cd $data;
  cd .. #compensate for .git at end of line
  DATE=$(date +%Y-%m-%d) &> /dev/null
  LOG_DATE=$(git log -1 HEAD --pretty=format:"%cd" --date=short)
  #////////////////////#
  # # todays date is
  # echo $DATE
  # # log date is
  # echo $LOG_DATE
  #////////////////////#

  StartDate=$(date -u -d "$DATE" +"%s")
  FinalDate=$(date -u -d "$LOG_DATE" +"%s")
  #////////////////////#
  # echo $FinalDate
  # echo $StartDate
  #////////////////////#
  if [[ "$StartDate" -eq "$FinalDate" ]];
  # if [[ "$DATE" -eq "$LOG_DATE" ]]; #this way doesn't work very well
  then
          committedToday=true;
          # echo $data
          # echo "commit found"
          # echo $committedToday


   fi;
#////////////////////#
# echo $committedToday
# echo "$data"
#////////////////////#

done
# <<< "$committedToday"
# echo $committedToday
echo $committedToday

# <<< "$(echo -e "$committedToday")"

# Temporary workaround for subshell issue

## echo $committedToday
# committedToday=$(head -1 committed.txt)

# echo $committedToday

if [ "$committedToday" = false ] ; then
    echo "You still need to commit!";
  else
    echo "You've committed today.";
fi
)
 # rm ~/committed.txt
