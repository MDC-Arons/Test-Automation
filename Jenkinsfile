pipeline {

    agent {
        docker {
            image 'python:3.12'
            args '-u root'
        }
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/MDC-Arons/Test-Automation.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'pip install -r requirements.txt'
            }
        }

        stage('Exposing environment variables'){
            steps {
                // can be accesed by going to: {Jenkins_URL}/pipeline-syntax/globals#env
                echo "GitLab branch name: ${BRANCH_NAME}"
                echo "This is the primary branch of the project: ${BRANCH_IS_PRIMARY}"
                echo "Build number: ${BUILD_NUMBER}"
                echo "Build ID: ${BUILD_ID}"
                echo "Job name: ${JOB_NAME}"
                echo "Name of the agent: ${NODE_NAME}"
            }
        }

        stage('Run Robot Tests') {
            steps {
                sh 'robot tests/'
            }
        }
    }
}
