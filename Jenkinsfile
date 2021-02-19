pipeline {
    agent any

	tools {
		maven 'maven 3.6'
	}

	environment {
		M2_INSTALL = "/home/gamutgurus/Distro/apache-maven-3.6.3/bin/mvn"
	}

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
			sh 'sshpass -p "gamut" scp target/gamutgurus.war gamut@172.17.0.3:/home/gamut/distro/apache-tomcat-8.5.56/webapps'
			sh 'sshpass -p "gamut" ssh gamut@172.17.0.3 "JAVA_HOME=/home/gamut/Distro/jdk1.8.0_251" "/home/gamut/distro/apache-tomcat-8.5.56/bin/startup.sh"'
	    	}
	}
    }
}
