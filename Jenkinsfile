pipeline {
    agent any
    /*
        docker {
            image 'maven:3.8.1-adoptopenjdk-11'
            args '-v /root/.m2:/root/.m2'
        }
    */
    tools { 
        maven 'Maven 3.8.6' 
        jdk 'jdk11'    
    }
    options {
        skipStagesAfterUnstable()
    }
    stages {
        stage('Build') {
            steps {
                sh 'mvn clean install -s settings.xml'
            }
        }
        stage('Check Artifact') {
            steps {
                sh """ 
                    ping google.com
                    pwd
                    ls -lrt
                    cp target/my-app-1.0-SNAPSHOT.jar . 
                """
            }
        }
        stage('Upload Artifact'){
            steps {
                sh 'mvn deploy'
            }
        }
        /*
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
        */
        stage('Deliver') { 
            steps {
                sh './jenkins/scripts/deliver.sh' 
            }
        }
        /*
        stage('workspacecleanup') {
            steps {
                cleanWs()
                sh """
                    pwd
                    ls -lrt         
                """
            }   
        }          
        */ 
    }
}