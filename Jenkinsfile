
pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Install Dependencies') {
            steps {
                sh 'pip install -r requirements.txt'
            }
        }
        stage('Run Robot Tests') {
            steps {
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
