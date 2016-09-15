#!/usr/bin/bash

echo "--------------------install git--------------------"
apt-get install git

echo "--------------------downloading golang--------------------"
#linux x86_64
wget https://storage.googleapis.com/golang/go1.7.1.linux-amd64.tar.gz

echo "--------------------umcompress go.tar.gz--------------------"
#decode to /usr/local
tar -C /usr/local -zxf go1.7.1.linux-amd64.tar.gz

echo "--------------------set golang env--------------------"
#set ENV
echo "export PATH=$PATH:/usr/local/go/bin" >> $HOME/.profile
echo "export GOPATH={$HOME}/vps-tools/go" >> $HOME/.profile
echo "export GOBIN=/usr/local/go/bin" >> $HOME/.profile

echo "--------------------install shadowsocks-go--------------------"
#install shadowsocks-go
go get github.com/shadowsocks/shadowsocks-go/cmd/shadowsocks-server

echo "-------------------- install done--------------------"






