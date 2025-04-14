pipeline {
    agent any

    stages {
        
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                sh './mvnw clean install'
            }
        }
        
        stage('Checkstyle') {
            steps {
                sh './mvnw checkstyle:check -Dcheckstyle.output.format=xml'
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
        
  post {
    always {
      archiveArtifacts artifacts: 'target/site/checkstyle.html', allowEmptyArchive: true

      recordIssues tools: [checkStyle(pattern: 'target/checkstyle-result.xml')]
    }

    failure {
      echo 'Build failed! Checkstyle violations or build errors may have occurred.'
    }

    success {
      echo 'Build completed successfully 🎉'
    }
  }
}
}