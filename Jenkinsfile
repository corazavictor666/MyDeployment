pipeline {
    environment {
        dockerImage= ''
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
          dockerImage.push("${env.BUILD_NUMBER}")
            dockerImage.push("latest")
        }
      }
    }

    stage('Deploy App') {
      steps {
        sh 'kubectl apply -f backend.yaml' 
        
      }
    }

  }
}