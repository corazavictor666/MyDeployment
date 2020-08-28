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
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }

      }
    }

    stage('Push Image') {
      steps {
        script {
          docker.withRegistry( "" ){
            dockerImage.push()
          }
        }

      }
    }

    stage('Deploy App') {
      steps {
        kubernetesDeploy(configs: 'backend.yaml', credentialsType: 'kubernetes', ssh: 'admin@172.16.14.26', kubeConfig: 'kubernetes_2')
      }
    }

  }
  environment {
    registry = '172.16.14.26:5000/gcc/sample'
    dockerImage = ''
  }
}