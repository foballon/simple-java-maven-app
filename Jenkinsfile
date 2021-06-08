pipeline {
    agent {
        docker {
            image 'maven:3-alpine' 
            args '-v /root/.m2:/root/.m2' 
        }
    }


    stages {
        stage('Build') {
            steps {
                sh 'mvn -B -DskipTests clean package'
            }
        }
        stage('Slack') {
            steps {
                slackSend(channel: "test-example", message: "https://www.nytimes.com", sendAsText: true)
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
                slackSend(channel: "test-example", message: "Test Success", sendAsText: true)
                sh """curl --request POST --url 'https://globetelecom.atlassian.net/rest/api/3/issue',
                  --user 'foballon@globe.com.ph:28D8cTzDM1AgpzeAoaHTEFA6' \\
                  --header 'Accept: application/json' \\
                  --header 'Content-Type: application/json' \\
                  --data '{ "update": {}, "fields": { "summary": "Main order flow broken", "parent": { "key": "TS } } }"""
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
    }
}
