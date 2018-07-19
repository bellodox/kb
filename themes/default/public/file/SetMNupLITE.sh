#!/bin/bash
################################################################################
# Original Author: TheWeakShall
# Program: SetMNupLITE.sh
# Purpose: Simple install script for MTS MasterNode
#
#   <Flavors>
#   FULL - installs everything needed if you wanted to compile the MTS wallet
#   LITE - only installs Methuselah binaries 
#
#   Run this script by using the command
#
#           bash SetMNupFULL.sh
#
################################################################################
output() {
    printf "\E[0;33;40m"
    echo $1
    printf "\E[0m"
}

displayErr() {
    echo
    echo $1;
    echo
    exit 1;
}

    output " "
    output "Welcome to MTS MasterNode Install Script"
    output "This script will ask you for: "
    output "MasterNode key (Generatted In MTS Wallet) "
    output "External IP (Make sure Port 7555 is open)"
    output "Username for RPC To Use"
    output "Password For RPC User"
	output " Please make sure you have the coins in the correct place "
    output " Also recommend Having your wallet open with debug console up "
    output " "
	output " Do Not Run This Script As Root!!!! "
	output " "
    read -e -p "MasterNode Key (Use debug console and typein 'masternode genkey'): " MKey
    read -e -p "External IP  : " EXIP
    read -e -p "RPC Username (can be anything) : " USER
    read -e -p "RPC password (can be anything): " USERPASS

    output " "
    output "Updating system and installing required packages."
    output " "
    sleep 3


    # Install git
    sudo apt-get install git -y
    
    output " "
    output "Installing fail2ban"
    output " "
    sleep 3
    
    sudo apt-get -y install fail2ban
    sudo service fail2ban restart
    sudo apt-get install ufw -y
    
    output " "
    output "Configuring fail2ban"
    output " "
    sleep 3
    
    sudo ufw default deny incoming
    sudo ufw default allow outgoing
    sudo ufw allow ssh
    sudo ufw allow 7555/tcp
    sudo ufw allow 22/tcp
    sudo ufw limit 22/tcp
    echo -e "${YELLOW}"
    sudo ufw --force enable
    echo -e "${NC}"

    output " "
    output "Installing Methuselah"
    output " "
    sleep 3
    
    wget https://github.com/methuselah-coin/methuselah/releases/download/v1.1.0.2/methuselah-1.1.0.1-linux.tar.xz
    mkdir ~/bin
    tar -xf methuselah-1.1.0.1-linux.tar.xz -C ~/bin
    source ~/.profile
    mkdir ~/.methuselah
    touch ~/.methuselah/methuselah.conf
    sleep 3

echo "rpcallowip=127.0.0.1
rpcuser=$USER
rpcpassword=$USERPASS
server=1
daemon=1
listen=1
maxconnections=256
masternode=1
masternodeprivkey=$MKey
externalip=$EXIP
promode=1" > ~/.methuselah/methuselah.conf

output " "
output "Looks like everything installed correctly"
output " "
output "to start your master node you need to start Methuselah Using"
output " "
output "                  methuselahd -daemon                  "
output " "
output " Once the daemon has started you can user"
output " "
output "                methuselah-cli getinfo                   "
output " "
output " Getinfo will give you a simple reading and should"
output " Shows more connections as the node catches up"
