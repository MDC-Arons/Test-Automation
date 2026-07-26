
pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/MDC-Arons/Test-Automation.git/'
            }
        }
        stage('Install pip') {
            steps {
                sh 'python get-pip.py'
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
