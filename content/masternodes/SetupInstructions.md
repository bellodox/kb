/*
Title: Setup Instructions
Description: Installation and configuration instructions for masternodes.
Sort: 1
*/

Please follow these instructions to manually setup your masternode.

### A. Local QT Wallet
First thing that is recommended is to send your masternode collateral transaction.
1. Open you QT wallet
2. Go to `File->Receiving Addresses`
3. Click on `New`
4. Enter in a `Label` for your masternode, ex. `MN1`
5. Click `OK` to save.
6. Right click on the new address and select `Copy Address`.
7. Click `Close`.
8. Click on the `Send` tab.
9. Right click in the `Pay To` field and select `Paste`.  You should notice that the label from step 4 appears in `Label`.
10. Click in the `Amount` field and enter `9600`.
11. Click on `Send`.
    - If asked, please enter your password.
12. Once the confirmation timer counts down click `Yes`.
    - Masternode collateral transactions require `15` confirmations.  This can be viewed by hovering over the transaction in the `Transactions` tab.


### B. Local QT Wallet
Now we need to collect masternode information.
1. In the wallet go to `Help->Debug Window` to open the debug console.
2. Type `masternode genkey` and press the Enter key.
    - This will be `MASTERNODE_PRIVATE_KEY` below so save it.
3. Type `masternode outputs` and press the Enter key.
    - This will be `MASTERNODE_TX` and `MASTERNODE_TX_INDEX` below so save it.


### C. Local QT Wallet
Now it is time to configure the `masternode.conf` file.
1. Open the `masternode.conf` file located in the application data folder.  If the file is not there create it.  Be sure that the whole file name is `masternode.conf` and NOT `masternode.conf.txt`. 
    - Windows - `%appdata%/methuselah`
    - Linux - `~/.methuselah`.
    - OSX - `~/Library/Application Support/methuselah`
    - Custom - if a custom location was defined during the initial run of the wallet that is the location to use.
2. After the comments on the next line please add the following.
```
MN1 IP_ADDRESS:7555 MASTERNODE_PRIVATE_KEY MASTERNODE_TX MASTERNODE_TX_INDEX
```
    - IP_ADDRESS - should be replaced with the VPS ip.
    - MASTERNODE_PRIVATE_KEY - should be replaced with the masternode private key generated above.
    - MASTERNODE_TX - is the transaction hash from `masternode outputs` above.
    - MASTERNODE_TX_INDEX - is the transaction index from `masternode outputs` above.
3. Make sure there are no empty lines at the end of the file or extra spaces at the end of the line.
4. Save the file.

### D. Remote VPS
Once logged into your remote VPS as `root` please enter these commands to setup your masternode.  It is recommended to setup security and run the masternode as a non-root user, this guide does cover this.

__Enter each line by line into the SSH console:__
```
cd ~
sudo apt-get update
sudo apt-get nano -y
sudo mkdir -p /usr/local/methuselah/bin
sudo adduser --disabled-password --gecos "" sap
sudo sed -i -e 's/usr\/local\/games/usr\/local\/methuselah\/bin/g' /etc/environment
sudo mkdir -p /home/sap/.methuselah
sudo touch /home/sap/.methuselah/methuselah.conf
sudo chown -R sap:sap /home/sap/
wget https://github.com/methuselah-coin/methuselah/releases/download/v1.1.0.4/methuselah-1.1.0.4-linux.tar.xz
tar -xvf methuselah-1.1.0.4-linux.tar.xz -C /usr/local/methuselah/bin
sudo chown -R sap:sap /usr/local/methuselah
wget clone https://github.com/methuselah-coin/mn-install/blob/master/service
sudo cp service /etc/init.d/methuselah
sudo chmod 755 /etc/init.d/methuselah
sudo update-rc.d methuselah defaults
rm -f methuselah-1.1.0.4-linux.tar.xz
rm -f service
sudo chown -R sap:sap /usr/local/methuselah
nano /home/sap/.methuselah/methuselah.conf
```

Now enter the following information in the `methuselah.conf`.
```
rpcallowip=127.0.0.1
rpcuser=CHANGE_ME
rpcpassword=CHANGE_ME
server=1
daemon=1
listen=1
maxconnections=256
masternode=1
masternodeprivkey=MASTERNODE_PRIVATE_KEY
externalip=IP_ADDRESS:7555
promode=1
addnode=node1.methuselahcoin.io:7555
addnode=node2.methuselahcoin.io:7555
addnode=node3.methuselahcoin.io:7555
addnode=node4.methuselahcoin.io:7555
addnode=node5.methuselahcoin.io:7555
addnode=node6.methuselahcoin.io:7555
addnode=node7.methuselahcoin.io:7555
addnode=node8.methuselahcoin.io:7555
addnode=node9.methuselahcoin.io:7555
```
Make sure that you update `CHANGE_ME` with your own personal information, make it secure, `IP_ADDRESS` with the public ip address of the VPS, and `MASTERNODE_PRIVATE_KEY` with masternode private key generated above.  Once done please `Ctrl+X` to save the file and then run the following.
```
chown -R sap:sap /home/sap
service methuselah start
service methuselah chain
service methuselah master
```
Verify that you get output and not an error from `service methuselah chain` and wait for the chain to sync.  Verify the block height in `service methuselah chain` with the block height on the [block explorer](https://explorer.methuselahcoin.io).


### C. Local QT Wallet
To complete the masternode activation.
1. Close the QT wallet.
2. Open the QT wallet.  We do this so the changes made `masternode.conf` are updated.
3. Go to the `Masternodes` tab and the `My Masternodes` sub-tab.  You should see your newly added masternode.
4. Go to `Help->Debug Window`.
5. Enter the command `masternode start-alias MN1`, replacing `MN1` with the alias value entered in `masternode.conf` and press the Enter key.
6. You should recieve a success message, you are done.


If you have any issues please contact us via [discord](https://discord.gg/KbqeYzU).
