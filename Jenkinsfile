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

        sh 'docker build -t k8s-app-front -f Dockerfile .'
      }
    }

    stage('Deploy App') {
      steps {
        script {
          kubernetesDeploy(configs: "backend.yaml", kubeconfigId: "kubeconfig")
        }

      }
    }

  }
}