pipeline {
    environment {
        dockerImage= ''
        registryCredential = 'docker-credentials'
    }

    agent any
    stages {

    stage('Checkout Source') {
      steps {
        git 'https://github.com/corazavictor666/MyDeployment.git'
      }
    }
           
    stage('Build image') {
      steps{
        script {
          dockerImage = docker.build ("k8s-app-front")
        }   
      }
    }

    stage('Push Image') {
      steps{
        script {
          docker.withRegistry(registryCredential) {
            dockerImage.push()
          }
        }
      }
    }
  }
}
  
