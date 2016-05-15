
#!/bin/bash
echo "Hello, "$USER".  Please enter the message you would like to see if you HAVE commit today  and press [ENTER]:"
read ymessage
echo $ymessage > ~/.Message.txt
echo "Please enter the message you would like to see if you HAVE NOT commit today and press [ENTER]: "
read nmessage
echo $nmessage >> ~/.Message.txt

chmod +x listRepos.sh
chmod +x GitCommitTracker.sh



echo "Is this your first time running setup? [y/n]:"
read yesorno

echo $yesorno

if [ "$yesorno" = "y" ]; then


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
    esac

# echo yes

elif [ "$yesorno" = "n" ]; then
echo
else
          echo Unexpected input. If this was your first time running, please try again.
fi







echo done!
