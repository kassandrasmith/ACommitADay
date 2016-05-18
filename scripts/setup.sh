
#!/bin/bash

echo "Hello, "$USER"."

echo "Please enter your github login e-mail and press [ENTER]"
read AUTHOR


echo "Please enter the message you would like to see if you HAVE made a commit today  and press [ENTER]:"
read ymessage
echo $ymessage > ~/.Message.txt
echo "Please enter the message you would like to see if you HAVE NOT made a commit today and press [ENTER]: "
read nmessage
echo $nmessage >> ~/.Message.txt
echo $AUTHOR >> ~/.Message.txt
chmod +x listRepos.sh
chmod +x GitCommitTracker.sh

echo $MYVARIABLE
if [ ! -f ~/.firsttimerunningflag ]; then

echo "Finding git repositories. . . This may take a while!"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

./listRepos.sh

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

cd
path=$(find . -name .key -prune 2>/dev/null)
# echo $path
newpath=$(echo $path | sed 's/.key//g')
# echo $newpath

case $SHELL in
*/zsh)
   # assume Zsh
   echo "(cd $newpath; ./GitCommitTracker.sh;)" >> .zshrc

   ;;
*/bash)
   # assume Bash
   echo "(cd $newpath; ./GitCommitTracker.sh;)" >> .bashrc
   ;;
*)
   # assume something else
   echo "This shell isn't supported yet!"
;;

esac

else
echo "Would you like to update the repository directory? [y/n]:"
read yorn
newsubstring=$(echo "$yorn" | tr '[:upper:]' '[:lower:]')
if [ "$newsubstring" = "y" ]; then

  echo "Finding git repositories. . . This may take a while!"
  echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
  ./listRepos.sh

else echo ""
fi

fi


touch ~/.firsttimerunningflag

echo done!
