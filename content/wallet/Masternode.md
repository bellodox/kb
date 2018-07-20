/*
Title: Wallet Masternodes
Description: Helpful information for wallet masternode related common issues.
Sort: 1
*/

#### After adding masternode to `masternode.conf` I get an error on open?
This is commonly caused by extra lines and whitespace.  Try removing all extra characters and empty lines from the `masternode.conf` file and restart/open the wallet.

#### Added a masternode to the `masternode.conf` file but it's not listed?
Upon initial addition of a masternode it might not show after the wallet restart.  To get the masternode to show and to start it click on `Start MISSING`.

#### Masternodes tab shows incorrect information on start?
In order for the wallet to show the correct information for your masternode(s) it needs to sync with the network.  Another thing to note is that the status updates about every minute, to speed up this process the `Update Status` button can be used.

#### Listed masternodes still show old information?
1. Close the wallet
2. Go to the Methuselah data directory
    - `~/.methuselah` for linux
    - `~/Library/Application Support/methuselah` for osx
    - `%appdata%\methuselah` for windows
3. Delete the `mncache.dat` file
4. Restart the wallet