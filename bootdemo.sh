#!/bin/bash
# 编译bootdemo
echo "------------------------------build bootdemo begin---------------------------------"
mvn clean install -DskipTests;
echo "------------------------------导出 bootdemo sql begin---------------------------------"
mysqldump -h 127.0.0.1 -uroot -pmysql123 bootdemo > boot.sql
# 拷贝demo.jar 到centos
echo "------------------------------copy bootdemo.jar begin---------------------------------"
scp target/bootdemo.jar mwl@192.168.41.133:~/github;
scp boot.sql mwl@192.168.41.133:~/github;
scp runbootdemo.sh mwl@192.168.41.133:~/github;
# 更新数据库
echo "------------------------------update bootdemo database begin---------------------------------"
mysql -h 192.168.41.133 -uroot -pmysql123 bootdemo < boot.sql;
# 启动bootdemo
echo "------------------------------启动 bootdemo ---------------------------------"
ssh mwl@192.168.41.133 "cd ~/github; ./runbootdemo.sh start"

