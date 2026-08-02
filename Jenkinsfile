
pipeline {
    agent any
    stages {
        stage('Debug') {
            steps {
                sh '''
                    which python || true
                    which python3 || true
                    python --version || true
                    python3 --version || true
                    which pip || true
                    which pip3 || true
                '''
            }
        }
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
