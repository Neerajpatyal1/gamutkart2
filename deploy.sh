#!/bin/bash
##
##
ENVIRONMENT=$1
if [ $ENVIRONMENT = "QA" ];then
	 sshpass -p "root" scp target/gamutkart.war neeraj@172.17.0.5:/home/gamut/Distro/apache-tomcat-8.5.56/webapps
        sshpass -p "root" ssh neeraj@172.17.0.5 "JAVA_HOME=/home/gamut/Distro/jdk1.8.0_251" "/home/gamut/Distro/apache-tomcat-8.5.56/bin/startup.sh"

elif  [ $ENVIRONMENT = "SIT" ];then
        sshpass -p "root" scp target/gamutkart.war neeraj@172.17.0.6:/home/gamut/Distro/apache-tomcat-8.5.56/webapps
        sshpass -p "root" ssh neeraj@172.17.0.6 "JAVA_HOME=/home/gamut/Distro/jdk1.8.0_251" "/home/gamut/Distro/apache-tomcat-8.5.56/bin/startup.sh"

echo "deployment has been done!"
fi

