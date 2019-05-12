#!/bin/bash
#输入不同的参数，选择执行不同的方法
APP_NAME=bootdemo.jar
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
	"help")
		help
		;;
esac
#检查程序是否在运行
function is_exists(){
	pid=`ps -ef|grep $APP_NAME|grep -v grep|awk '{print $2}'`
	#如果不存在返回1 ， 存在返回0
	if [-z $pid]
	then
		return 1
	else
		return 0
	fi

}
function status(){
	is_exists
	if [$? -eq "0"]
	then 
		echo "$APP_NAME is already running. pid  = $pid"
	else
		

}

function start(){
	
}