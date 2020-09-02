pipeline {
    environment {
      registry = "172.16.14.26:5000/gcc/sample"
      dockerImage = ""
    }

    agent {
      kubernetes {
          cloud 'kubernetes'
          yamlFile 'backend.yaml'
          defaultContainer 'backend-client'
          label 'jenkins'
      }
    }
    
    stages {

    stage('Checkout Source') {
        steps {
          git 'https://github.com/corazavictor666/MyDeployment.git'
      }
    }
           
    stage('Build image') {
        steps{
          script {
            dockerImage = docker.build registry
        }   
      }
    }

    stage('Push Image') {
        steps{
          script {
            docker.withRegistry( "" ){
              dockerImage.push()
          }
        }
      }
    }
  
    stage('Deploy Kubernetes') {
        steps {
          sh 'app-k8s-on'
      }
    }
  }
}
