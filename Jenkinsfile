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
    environment{
        def gitCommitHash = sh(returnStdout: true, script: "git log -n 1 --pretty=format:'%h'").trim()
        def gitCommitTimestamp = sh(returnStdout: true, script: "git log -1 --pretty='%cd' --date=format:'%Y.%m.%d-%H%M%S'").trim()
        jfrog_creds = credentials('jfrog-creds')
    }

    stages {
        stage('Build') {
            steps {
                sh 'mvn clean install'
                //'mvn clean install -s settings.xml'
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
        /*
        stage('Upload Artifact'){
            steps {
                sh 'mvn deploy -s settings.xml'
            }
        }
        */
        stage('Upload Artifact'){
            steps {
                sh """
                    curl -u ${jfrog_creds} -X PUT \
                    "https://wsa.jfrog.io/artifactory/wsaproject-libs-snapshot-local/mycompany/my-app-1.0-SNAPSHOT.${gitCommitTimestamp}.${gitCommitHash}.jar" \
                    -T target/my-app-1.0-SNAPSHOT.jar
                """
            }
        }

        stage('Retrieve Artifact'){
            steps{
                sh """
                     curl -u ${jfrog_creds} -X GET \
                    "https://wsa.jfrog.io/artifactory/wsaproject-libs-snapshot-local/mycompany/my-app-1.0-SNAPSHOT.jar"
                    ls
                """
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
                    ls -a
                    curl -u foballon:#Limitless4499 "https://anypoint.mulesoft.com/cloudhub/api/v2/applications" \
                    -X PUT -H 'Accept: */*' -H 'Content-Type: application/json' -d 'property.json' \
                    -H "X-ANYPNT-ENV-ID: 71bedb3c-c2dc-468d-a113-a538a1111f1d"
                """
                //                    -X PUT -H 'Accept: */*' -d "{\n  \"action\": \"UPDATE\",\n  \"domains\": [\n    \"hello-world-asw\"\n  ]\n}" \
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