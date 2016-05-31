#!/bin/bash
#Simple script lists the repositories on your machine
find ~ -name .git -type d -prune 2>/dev/null  > RepositoryDirectory.txt
#add globbers for files with a newline
awk '{gsub(/ /,"\\ ")}8' RepositoryDirectory.txt > gits.txt

#Don't break on whitespaces
IFS=''
cat gits.txt |
(while read data
do
#not necessary, but a safeguard to get to root
cd
  # line=$data;
  cd $data;
  # echo "$line";
#compensate for the .git at the end
  cd ..
  LOG_DATE=$(git log  -1 -- HEAD --pretty=format:"%cd" --date=short &>/dev/null)
  error=${?}

  if [[ $error -ne 0 ]]; then
    echo "$data" >> ~/.BrokenRepos.txt
    echo $data produced an error and is being ignored
  fi

done
)

grep -v -x -f ~/.BrokenRepos.txt gits.txt > RepositoryDirectory.txt
rm ~/.BrokenRepos.txt
rm gits.txt

echo All Done! Working repositories listed in RepositoryDirectory.txt
