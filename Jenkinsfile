pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/sashabrava/demo-docker'
            }
        }

        stage('Build') {
            steps {
                sh './mvnw clean package'
            }
        }
        
        stage('Checkstyle') {
            steps {
                sh './mvnw checkstyle:check'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t spring-boot-app ./spring-boot-app'
            }
        }

        stage('Run App') {
            steps {
                sh 'docker run -d -p 8081:8080 spring-boot-app'
            }
        }
    }
}