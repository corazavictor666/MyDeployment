pipeline {

    agent any

    stages {

        stage('Checkout Source') {
            steps {
                git https://github.com/corazavictor666/MyDeployment.git
            }
        }

        stage('Build') {
            steps {
                echo 'Starting to build docker image'

                script {
                    def customImage = docker.build("my-image:${env.BUILD_ID}")
                    customImage.push()
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry ("") {
                        dockerImage.push
                    }
                }

            }
        }
        stage('Deploy App to Kubernetes') {
            steps {
                script {
                    kubernetesDeploy(configs: "backend.yaml", kubeconfigID: "kubeconfig")
                }
            }
        }    
    }
}