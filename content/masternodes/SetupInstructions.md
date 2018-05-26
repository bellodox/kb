/*
Title: Setup Instructions
Description: Installation and configuration instructions for masternodes.
Sort: 1
*/

## Setup Instructions
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
Once logged into your remote VPS as root please enter these commands to setup your masternode.  It is recommended to setup security and run the masternode as a non-root user, this guide does not cover this at this time.

__Enter each line by line into the SSH console:__
```
wget https://github.com/methuselah-coin/methuselah/releases/download/v1.0.1.0/methuselah-1.0.1.0-linux.tar.gz
tar -zxvf methuselah-1.0.1.0-linux.tar.gz -C /usr/local/bin
rm -f methuselah-1.0.1.0-linux.tar.gz
mkdir ~/.methuselah
nano ~/.methuselah/methuselah.conf
```

Now enter the following information in the `methuselah.conf` file changing the `rpcuser=` and `rpcpassword=` information.
```
rpcuser=changeme
rpcpassword=changeme
server=1
daemon=1
```
Once done please `Ctrl+X` to save the file and then run the following.
```
methuselahd
methuselah-cli getinfo
```
Verify that you get output and not an error from `methuselah-cli getinfo` and wait for the chain to sync.  Verify the block height in `methuselah-cli getinfo` with the block height on the [block explorer](https://explorer.methuselahcoin.io).

