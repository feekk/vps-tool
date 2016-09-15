#!/usr/bin/bash

start(){
    echo "starting anyconnect...."
    nohup ocserv -c /etc/ocserv/ocserv.conf -f -d 1 > /dev/null 2>&1 &
    echo "started anyconnected!!"
}

stop(){
    count=$(ps aux |grep ocserv |grep -v grep|wc -l)
    if [ ${count} -gt 0 ];then
        echo "killing anyconnect ..."
        ps axu |grep ocserv |grep -v grep |awk '{print $2}'|xargs -n 1 kill -9
        echo "killed anyconnect!!!"
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
