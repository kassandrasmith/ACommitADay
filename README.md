ACommitADay
====================
An in-shell reminder to make your daily commit
![ACommitADay Screenshot](https://raw.githubusercontent.com/kassandrasmith/ACommitADay/master/meta/Screenshot.png)


Prerequisites
---------------------

Unix-based operating system (OS X or Linux)

Works best in Zsh

git should be installed

Basic Installation
---------------------

Download and save the scripts to a memorable location (hereto referred to as "/path/to/scripts" )

Open terminal
>ctrl+alt+t

Edit your .bashrc or .zshrc script
>gedit .bashrc

or
>gedit .zshrc

add the following line to the end of the file (keeping the parens)

>(cd /path/to/scripts; ./GitCommitTracker.sh;)


save and exit

cd into /path/to/scripts and make the two main scripts executable

>chmod +x listRepos.sh

>chmod +x GitCommitTracker.sh

Run the listRepos to generate a file with all of the git repositories on your machine.

>./listRepos.sh

:boom: When running listRepos, empty or broken repositories will have a "fatal" warning message and must be dealt with. Therefore it's also recommended that you run listRepos anytime you create a new repository to ensure that it is being properly tracked.

Now a message will pop up everytime you open the terminal letting you know if you've committed!

Changing the Message
---------------------

The messages can be changed by changing these lines

![Changing the message](https://raw.githubusercontent.com/kassandrasmith/ACommitADay/master/meta/WhattoChange.png)

to your preferred messages. These lines are easily found by either looking for or searching for the consecutive bangs (!!!!)
