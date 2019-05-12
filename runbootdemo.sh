#!/bin/bash
#输入不同的参数，选择执行不同的方法
APP_NAME=bootdemo.jar
#检查程序是否在运行
function is_exists(){
	pid=`ps -ef|grep $APP_NAME|grep -v grep|awk '{print $2}'`
	#如果不存在返回1 ， 存在返回0
	if [ -z $pid ]
	then
		return 1
	else
		return 0
	fi

}
function status(){
	is_exists
	if [ $? -eq "0" ]
	then 
		echo "$APP_NAME is already running. pid  = $pid"
	else
		echo "$APP_NAME is not running. "
	fi
}

function start(){
	is_exists
	if [ $? -eq "0" ]
	then 
		echo "$APP_NAME is already running. pid  = $pid"
	else
		nohup java -jar $APP_NAME --spring.profiles.active=dev > /dev/null 2>&1 &
	fi
}
function stop(){
	is_exists
	if [ $? -eq "0" ]
	then 
		kill -9 $pid
	else
		echo "$APP_NAME is not running. "
	fi
}
function restart(){
	stop
	start
}
function help(){
	echo "Usage: sh 执行脚本.sh [start|stop|restart|status]"
    exit 1
}
case "$1" in 
	"start")
		start
		;;
	"restart")
		restart
		;;
	"stop")
		stop
		;;
	"status")
		status
		;;
	"*")
		help
		;;
esac
