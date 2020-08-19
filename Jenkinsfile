pipeline {
    environment {
        registry = 'coraza666/k8s-cluster1'
        registryCredential = 'dockerhub'
        dockerImage=''
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
          dockerImage = docker.build registry + ''
        }
      }
    }

    stage('Push Image') {
      steps{
        script {
          docker.withRegistry( '' ) {
            dockerImage.push('')
          }
        }
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