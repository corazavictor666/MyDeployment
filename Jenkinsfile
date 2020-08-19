pipeline {
    agent any
        environment {
        
	//Add Docker user
        DOCKER_IMAGE_NAME = "coraza666/k8s-cluster1"

    stages {

    stage('Checkout Source') {
      steps {
        git 'https://github.com/corazavictor666/MyDeployment.git'
      }
    }
           }
    stage('Build image') {
      steps{
        script {
          app = docker.build(DOCKER_IMAGE_NAME)
        }
      }
    }   
}