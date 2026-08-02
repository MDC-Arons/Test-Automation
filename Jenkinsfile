pipeline {

    agent {
        docker {
            image 'python:3.12'
        }
    }

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
                git branch: 'main', url: 'https://github.com/MDC-Arons/Test-Automation.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'python3 -m pip install -r requirements.txt'
            }
        }

        stage('Run Robot Tests') {
            steps {
                sh 'robot tests/'
            }
        }
    }
}
