pipeline {
    agent any
    /*
        docker {
            image 'maven:3.8.1-adoptopenjdk-11'
            args '-v /root/.m2:/root/.m2'
        }
    */
    tools { 
      maven 'MAVEN_HOME' 
      jdk 'jdk8' 
    }
    options {
        skipStagesAfterUnstable()
    }
    stages {
        stage('Build') {
            steps {
                sh 'mvn -B -DskipTests clean package'
            }
        }
        stage('Check Artifact') {
            steps {
                sh """ 
                    pwd
                    ls -lrt
                    cp target/my-app-1.0-SNAPSHOT.jar . 
                """
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
        stage('Deliver') { 
            steps {
                sh './jenkins/scripts/deliver.sh' 
            }
        }
        stage('workspacecleanup') {
            steps {
                cleanWs()
                sh """
                    pwd
                    ls -lrt         
                """
            }   
        }           
    }
}