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
                    pwd
                    ls -lrt
                    cp target/my-app-1.0-SNAPSHOT.jar . 
                """
            }
        }
        stage('Upload Artifact'){
            steps {
                sh 'mvn deploy -s settings.xml'
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

        stage('Deploy to Cloudhub') {
            steps {
                sh """
                    curl -u foballon:#Limitless4499 "https://anypoint.mulesoft.com/cloudhub/api/v2/applications" \
                    -X PUT -H 'Accept: application/json' -H 'Content-Type: application/json' -d "{\n  \"action\": \"UPDATE\",\n  \"domains\": [\n    \"hello-world-asw\"\n  ]\n}" \
                    -H "X-ANYPNT-ENV-ID: '71bedb3c-c2dc-468d-a113-a538a1111f1d'"
                """
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