pipeline {
    agent any

	tools {
		maven 'maven 3.6'
	}
//
//	environment {
//		M2_INSTALL = "/home/gamut/Distros/apache-maven-3.6.0/bin/mvn"
//	}

    stages {
	stage('Clone-Repo') {
		steps {
			checkout scm
		}
	}
	stage('Build') {
	    	steps {
			sh 'mvn install -DskipTests'
		}
	}
	stage('Unit Tests') {
		steps {
			sh 'mvn surefire:test'
		}
	}
	stage('Deployment') {
	    	steps {
			print "Deployment is done!"
			sh 'sshpass -p "root" scp target/gamutkart.war neeraj@172.17.0.6:/home/gamut/Distro/apache-tomcat-8.5.56/webapps'
			sh 'sshpass -p "root" ssh neeraj@172.17.0.6 "JAVA_HOME=/home/gamut/Distro/jdk1.8.0_251" "/home/gamut/Distro/apache-tomcat-8.5.56/bin/startup.sh"'
	    	}
	}
    }
}
