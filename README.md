ACommitADay
====================
An in-shell reminder to make your daily commit
![ACommitADay Screenshot](https://raw.githubusercontent.com/kassandrasmith/ACommitADay/master/meta/Screenshot.png)


Prerequisites
---------------------

* Unix-based operating system (OS X or Linux)
* git
* Tested in Zsh

Installation
---------------------

Clone the repository

    git clone https://github.com/kassandrasmith/ACommitADay.git ~/.ACommitADay

Edit your .bashrc or .zshrc script using the editor of your choice
    `gedit .bashrc` or `gedit .zshrc`

add the following line to the end of the file (keeping the parens)

    (cd ~/.ACommitADay/scripts; ./GitCommitTracker.sh;)

save and exit

Make the two main scripts executable:

    cd ~/.ACommitADay/scripts
    chmod +x listRepos.sh
    chmod +x GitCommitTracker.sh

Run the listRepos to generate a file with all of the git repositories on your machine.

    ./listRepos.sh

:boom: When running listRepos, empty or broken repositories will have a "fatal" warning message. This, along with the path to the "broken" directory will be printed so that you can investigate. If a repository gives a warning message, we ignore it.


:boom: For now, you must run listRepos anytime you create a new repository to ensure that it is being properly tracked.

Now a message will pop up everytime you open the terminal letting you know if you've committed!

Changing the Message
---------------------

The messages can be changed by changing these lines
````sh
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!#
echo "You still need to commit!"; #feel free to change me!
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!#
echo "You've committed today" # "to" $whereCommit #feel free to change me!

````
to your preferred messages. These lines are easily found by either looking for or searching for the consecutive bangs (!!!!) 
If you want to see where you've committed, remove the comment, to make the line 

    echo "You've committed today" "to" $whereCommit #feel free to change me!

Only one repo will be shown.
