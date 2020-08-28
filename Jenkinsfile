pipeline {
  agent any
  stages {
    stage('Checkout Source') {
      steps {
        git 'https://github.com/corazavictor666/MyDeployment.git'
      }
    }

    stage('Build image') {
      steps {
        script {
          dockerImage = ('k8s-app-front')
        }

      }
    }

    stage('Push Image') {
      steps {
        script {
          dockerImage.push("lastest")
        }

      }
    }

  }
}