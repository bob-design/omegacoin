# omegacoin-Masternode Setup 12.5.1

Linux VPS Masternode Update:

Shell script to run as Root to update a Omegacoin Masternode on a Linux server running Ubuntu 16.04. Use it on your own risk.

## Inlcuding Update to 12.5.1
```
wget https://raw.githubusercontent.com/bob-design/omegacoin/master/omega_setup.sh

chmod 755 omega_setup.sh

./omega_setup.sh

```
***

## Sentinel for omegacoin
```
sudo apt-get -y install python-virtualenv virtualenv
```
```
git clone https://github.com/omegacoinnetwork/sentinel.git && cd sentinel
```
```
virtualenv ./venv
```
```
./venv/bin/pip install -r requirements.txt
```
```
crontab -e
```

**This line will open a Linux editor , pick Nano , and add this at the last line (below the # ) , you can navigate in Nano with the arrows of your keyboard :**
```
* * * * * cd /root/sentinel && ./venv/bin/python bin/sentinel.py >/dev/null 2>&1
```
**Then hit Ctrl+x , Y and Enter to save**

```
nano ~/sentinel/sentinel.conf
```
**change /home/username/ to /root/ and save, Ctrl+x, Y and enter.**

**If you did the setup of your VPS with a different username from “root” adapt the path !**
```
./venv/bin/py.test ./test
```
***

## Donation 

Any donation is highly appreciated 

**OMEGA:** oSSWU7zJr5EbnfQEzTzbFbRyMgDncJk1Y9

**BTC:** 3HGE6FP6GMvSAbH87Ejx49KniNixqiz1jB

**ETH:** 0xB1643b83dF7e7D588939B7412c9F8AB5c2f99Ce3

**LTC:** MNbr9NCKjAcWN8BpHWn2YNcPFmZ9PDEz3x

