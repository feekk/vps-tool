#!/usr/bin/bash

start(){	
	echo "starting ssserver..."
	nohup ssserver -c ../conf/shadowsocks.conf.used > /dev/null 2>&1 &
	echo "started ssserver!!!"
}
stop(){
	count=$(ps aux |grep ssserver |grep -v grep|wc -l)
	if [ ${count} -gt 0 ];then
		echo "killing ssserver..."
		ps axu |grep ssserver |grep -v grep |awk '{print $2}'|xargs -n 1 kill -9
		echo "killed ssserver!!!"
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

