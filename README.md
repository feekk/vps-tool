# vps-tool
vps-tool is a collection pakcage of tools which contains the shadowsocks/anyconnect install and set-up procedure.

## info
**soft support list**

[`ssserver`](https://github.com/shadowsocks/shadowsocks/wiki)

[`shadowsocks-go`](https://github.com/shadowsocks/shadowsocks-go)

[`ocserv`](http://www.infradead.org/ocserv/manual.html)

## directory

**vps-tool/bin**

bin folder contains the init and set-up sh file

`init_iptable.sh` : init vps iptable rules so it could transfer our flow

`ocserv_controller.sh`: ocserv controller script, accept params start,stop,restart

`shadowsocks-go-server_controller.sh`: shadowsocks-go's server controller, accept params start, stop, restart

`ssserver_controller.sh`: shadowsocks's(python) server controller, accept params start, stop, restart

**vps-tool/conf**

the config file will be here

`iptable-rules.conf`: iptable rules config file which is export by vps, `init_iptable.sh` will be load this config

`ocserv.conf` : ocserv server config file, it will be move to /etc/ocserv/ dir after ocserv installed

`shadowsocks.conf`: shadowsocks common config

`switchy-rules.conf`: chrome plugin SwitchShape's http address router controller

**vps-toil/go**

go folder is go worknamespace ,source core of go program will be here

`SwitchShape` is go source core

**vps-tool/install**

install sh scrpit will be here

`ocserv.ubuntu14.04.sh`: ocserv install script

`shadowsocks-go.ubuntu14.04.sh`: shadowsocks-go install script

`ssserver.ubuntu14.04.sh`: shadowsocks's(python) install script


## Usage

### all of this executable file must be run by root and you should update you repositories list by use: sudo apt-get update in ubuntu

**install ocserv**

    git clone git@github.com:feekk/vps-tool.git $HOME
    
    cd $HOME/vps-tool/install
    sh ./ocserv.ubuntu14.04.sh
    
    cd $HOME/vps-tool/bin
    sh ./init_iptables.sh
    #According to the script output content to carry out 
    #vim /etc/sysctl.conf
    #net.ipv4.ip_forward=1
    #sysctl -p /etc/sysctl.conf
    
    cd $HOME/vps-tool/bin
    sh ./ocserv_controller.sh start
    
**install shadowsocks-go**
    
    git clone git@github.com:feekk/vps-tool.git $HOME
    
    cd $HOME/vps-tool/install
    sh ./shadowsocks-go.ubuntu14.04.sh
    
    cd $HOME/vps-tool/bin
    sh ./init_iptables.sh
    #According to the script output content to carry out 
    #vim /etc/sysctl.conf
    #net.ipv4.ip_forward=1
    #sysctl -p /etc/sysctl.conf
    
    cd $HOME/vps-tool/bin
    sh ./shadowsocks-go-server_controller.sh start

**install shadowsocks(python)**
    
    git clone git@github.com:feekk/vps-tool.git $HOME
    
    cd $HOME/vps-tool/install
    sh ./ssserver.ubuntu14.04.sh
    
    cd $HOME/vps-tool/bin
    sh ./init_iptables.sh
    #According to the script output content to carry out 
    #vim /etc/sysctl.conf
    #net.ipv4.ip_forward=1
    #sysctl -p /etc/sysctl.conf
    
    cd $HOME/vps-tool/bin
    sh ./ssserver_controller.sh start
    
**install SwitchShape/SwitchyOmega customer router filter**

    git clone git@github.com:feekk/vps-tool.git $HOME
    
    cd $HOME/vps-tool/go/src/SwitchRules/
    make
    
    cd $HOME/vps-tool/go/bin
    
    nohup ./SwitchRules >/dev/null 2>&1 &
    
    #curl :{ip}:8484/getRules
    
    #add filter in conf conf/switchy-rules.conf


