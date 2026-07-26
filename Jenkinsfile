
pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git branch 'main', url: 'https://github.com/MDC-Arons/Test-Automation'
            }
        }
        stage('Install Dependencies') {
            steps {
                sh "Install Dependencies"
                sh 'pip install -r requirements.txt'
            }
        }
        stage('Run Robot Tests') {
            steps {
                sh "Run Robot Tests"
                sh 'robot tests/'
            }
        }
    }
    post {
        always {
            archiveArtifacts artifacts: '*.xml,*.html,log.html,report.html'
        }
    }
}
