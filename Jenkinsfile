pipeline {
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
          dockerImage = ('k8s-app-front')
        }   
      }
    }

    stage('Push Image') {
      steps{
        script {
          docker.withRegistry('https://registry.hub.docker.com', registryCredential ) {
            dockerImage.push("${env.BUILD_NUMBER}")
            dockerImage.push("lastest")
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