/*
Title: Wallet Sync
Description: Help related to wallet syncing. 
Sort: 1
*/

#### Wallet does not sync?
Please add the following nodes to the `methuselah.conf` file located in the data directory.
    - `~/.methuselah` for linux
    - `~/Library/Application Support/methuselah` for osx
    - `%appdata%\methuselah` for windows

Nodes to add to `methuselah.conf`:
```
addnode=node1.methuselahcoin.io:7555
addnode=node2.methuselahcoin.io:7555
addnode=node3.methuselahcoin.io:7555
addnode=node4.methuselahcoin.io:7555
```