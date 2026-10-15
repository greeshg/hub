
pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "greeshma18/lab10"
    }

    stages {

        stage('Clone Repository') {
            steps {
                git 'https://github.com/greeshg/hub.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${DOCKER_IMAGE}:v1")
                }
            }
        }

        stage('Login and Push to Docker Hub') {
            steps {
                script {
                    docker.withRegistry(
                        'https://index.docker.io/v1/',
                        'dockerhub-creds'
                    ) {
                        docker.image("${DOCKER_IMAGE}:v1").push()
                    }
                }
            }
        }
    }

    post {
        success {
            echo 'Image successfully built and pushed to Docker Hub'
        }

        failure {
            echo 'Pipeline failed'
        }
    }
}
