#!/usr/bin/bash

start(){
    echo "starting shadowsocks-server..."
    nohup shadowsocks-server -c ../conf/shadowsocks.conf.used > /dev/null 2>&1 &
    echo "started shadowsocks-server!!!"
}
stop(){
    count=$(ps aux |grep shadowsocks-server |grep -v grep|wc -l)
    if [ ${count} -gt 0 ];then
        echo "killing shadowsocks-server..."
        ps axu |grep shadowsocks-server |grep -v grep |awk '{print $2}'|xargs -n 1 kill -9
        echo "killed shadowsocks-server!!!"
    fi
}

case "$1" in
start)
    start
    ;;
stop)
    stop
    ;;
restart)
    stop
    start
    ;;
*)
    echo  "Usage Parmas: sh {$0} {start|stop|restart}"
esac
