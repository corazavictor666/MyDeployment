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
            sh "docker login -u coraza666 -p Persia$666" {
              myImage.push("${env.BUILD_NUMBER}")
              myImage.push("latest")
            }   
      }

    }
    }
  }
  
}