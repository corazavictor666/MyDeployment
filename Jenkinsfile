pipeline {
    environment {
      registry = "172.16.14.26:5000/gcc/sample"
      dockerImage = ""
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
          agent {
            kubernetes {
                label 'app-k8s-on'
                yamlFile 'backend.yaml'
                defaultContainer 'backend-client'
      }
    }
        steps {
          sh 'kubectl apply -f backend.yaml'
      }
    }
  }
}
