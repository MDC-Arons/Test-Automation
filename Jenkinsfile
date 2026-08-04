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

        // Setting environment variable
        // accomplished via: environment directive

        environment {
            TEST_FLAG = 'TRUE'
        }

        stage('Install Dependencies') {
            steps {
                sh 'pip install -r requirements.txt'
            }
        }

        stage('Exposing environment variables'){
            steps {
                // can be accesed by going to: {Jenkins_URL}/pipeline-syntax/globals#env
                echo "GitLab branch name: ${env.BRANCH_NAME}"
                echo "This is the primary branch of the project: ${env.BRANCH_IS_PRIMARY}"

                echo "Build number: ${env.BUILD_NUMBER}" // build number
                echo "Build ID: ${env.BUILD_ID}" // build ID number (= build number)

                echo "Job name: ${env.JOB_NAME}" // name van de job, ofwel de pipeline in dit geval.
                echo "Job base name (stripped off folder paths): ${env.JOB_BASE_NAME}" // name van de job, ofwel de pipeline in dit geval.

                echo "Name of the agent: ${env.NODE_NAME}" // in dit geval name van de agent waar de Jenkins container draait?

                echo "Absolute path of the directory assigned to the build as workspace: ${env.WORKSPACE}"


                echo "Absolute path of the directory assigned to the build as workspace: ${env.WORKSPACE}"

                echo "Costum set test environment variables TEST_FLAG -> ${TEST_FLAG}"

            }
        }

        stage('Run Robot Tests') {
            steps {
                sh 'robot tests/'
            }
        }
    }
}
