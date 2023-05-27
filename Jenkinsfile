pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                sh '''
                    echo 'Hello World'
                    docker -v
                '''
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                    docker -v 
                    docker build -t feedback-app-image:v1 .
                    docker images
                '''
            }
        }
    }
}
