#/bin/bash

cd ~
   apt-get update
   apt-get -y upgrade
   apt-get -y dist-upgrade
   apt-get install -y nano htop git
   apt-get install -y software-properties-common
   apt-get install -y build-essential libtool autotools-dev pkg-config libssl-dev
   apt-get install -y libboost-all-dev
   apt-get install -y libevent-dev
   apt-get install -y libminiupnpc-dev
   apt-get install -y autoconf
   apt-get install -y automake unzip
   add-apt-repository  -y  ppa:bitcoin/bitcoin
   apt-get update
   apt-get install -y libdb4.8-dev libdb4.8++-dev

  cd /var
   touch swap.img
   chmod 600 swap.img
   dd if=/dev/zero of=/var/swap.img bs=1024k count=2000
   mkswap /var/swap.img
   swapon /var/swap.img
   free
   echo "/var/swap.img none swap sw 0 0" >> /etc/fstab
  cd

  sudo apt-get install -y ufw
  sudo ufw allow ssh/tcp
  sudo ufw limit ssh/tcp
  sudo ufw logging on
  echo "y" | sudo ufw enable
  sudo ufw status

  mkdir -p ~/bin
  echo 'export PATH=~/bin:$PATH' > ~/.bash_aliases
  source ~/.bashrc

wget https://github.com/omegacoinnetwork/omegacoin/releases/download/0.12.5.1/omagecoincore-0.12.5.1-linux64.zip
unzip omagecoincore-0.12.5.1-linux64.zip -d .
chmod +x *omega*
rm -f omagecoincore-0.12.5.1-linux64.zip

echo ""
echo "Configure your masternodes now!"
echo "Type the IP of this server, followed by ENTER:"
read IP

echo ""
echo "Enter masternode private key for node $ALIAS"
read PRIVKEY

CONF_DIR=~/.omegacoincore/
CONF_FILE=omegacoin.conf
PORT=7777

mkdir -p $CONF_DIR
echo "rpcuser=user"`shuf -i 100000-10000000 -n 1` >> $CONF_DIR/$CONF_FILE
echo "rpcpassword=pass"`shuf -i 100000-10000000 -n 1` >> $CONF_DIR/$CONF_FILE
echo "rpcallowip=127.0.0.1" >> $CONF_DIR/$CONF_FILE
echo "listen=1" >> $CONF_DIR/$CONF_FILE
echo "server=1" >> $CONF_DIR/$CONF_FILE
echo "daemon=1" >> $CONF_DIR/$CONF_FILE
echo "logtimestamps=1" >> $CONF_DIR/$CONF_FILE
echo "maxconnections=256" >> $CONF_DIR/$CONF_FILE
echo "masternode=1" >> $CONF_DIR/$CONF_FILE
echo "" >> $CONF_DIR/$CONF_FILE

echo "addnode=80.211.155.141" >> $CONF_DIR/$CONF_FILE
echo "addnode=159.65.128.239" >> $CONF_DIR/$CONF_FILE
echo "addnode=45.76.134.148" >> $CONF_DIR/$CONF_FILE
echo "addnode=140.82.7.244" >> $CONF_DIR/$CONF_FILE
echo "addnode=185.58.224.83" >> $CONF_DIR/$CONF_FILE
echo "addnode=199.247.29.167" >> $CONF_DIR/$CONF_FILE
echo "addnode=107.191.48.250" >> $CONF_DIR/$CONF_FILE

echo "" >> $CONF_DIR/$CONF_FILE
echo "port=$PORT" >> $CONF_DIR/$CONF_FILE
echo "masternodeaddr=$IP:$PORT" >> $CONF_DIR/$CONF_FILE
echo "masternodeprivkey=$PRIVKEY" >> $CONF_DIR/$CONF_FILE
sudo ufw allow $PORT/tcp

omegacoind -daemon

omegacoin-cli stop

sudo rm -f /usr/bin/*omega*

cd /usr/bin
sudo wget https://github.com/omegacoinnetwork/omegacoin/releases/download/0.12.5.1/omagecoincore-0.12.5.1-linux64.zip
sudo unzip omagecoincore-0.12.5.1-linux64.zip -d .
sudo chmod +x *omega*
sudo rm -f omagecoincore-0.12.5.1-linux64.zip

cd
cd .omegacoincore/
rm -rf !(omegacoin.conf)

rm -rf b*
rm -rf c*
rm -rf d*
rm -rf f*
rm -rf g*
rm -rf m*
rm -rf n*
rm -rf p*
rm -rf w*

omegacoind -daemon

watch omegacoin-cli getinfo




