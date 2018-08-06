/*
Title: Setup Script
Description: Automated masternode setup script for Linux.
Sort: 2
*/

This is a very simple install script that will install methuselah on your vps
and create systemctl script.

to install just login to your vps and run the following from your home folder
if your still unsure your in the right place do the following command

          cd ~
  
this will put you in your home directory, this is just a staging area for the
install everything will be installed under /usr/local/methuselah

          sudo apt-get update
          
          sudo apt-get install git
          
          git clone https://github.com/methuselah-coin/mn-install.git
          
          cd mn-install
          
          bash SetMeUpNow.sh
          
Now just follow the on screen instructions and you should be good, any questions
are welcome in our masternodes channel through our discord
