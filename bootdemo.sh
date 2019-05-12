#!/bin/bash
# 编译bootdemo
echo "------------------------------build bootdemo begin---------------------------------"
mvn clean install -DskipTests;
# 拷贝demo.jar 到centos
echo "------------------------------copy bootdemo.jar begin---------------------------------"
scp target/bootdemo.jar mwl@192.168.41.133:~/github;
# 更新数据库
echo "------------------------------update bootdemo database begin---------------------------------"
scp boot.sql mwl@192.168.41.133:~/github;
mysql -h 192.168.41.133 -uroot -pmysql123 bootdemo < boot.sql;
# 启动bootdemo
ssh mwl@192.168.41.133 "cd ~/github; java -jar bootdemo.jar --spring.profiles.active=dev"

