pipeline {
    environment {
      registry = "172.16.14.26:5000/gcc/sample"
      dockerImage = "k8s-app-front"
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
            dockerImage = k8s-app-front
        }   
      }
    }

    stage('Push Image') {
        steps{
          script {
            docker.withRegistry( "" ){
              dockerImage.push('k8s-app-front')
          }
        }
      }
    }
  
    stage('Deploy Docker Images') {
        steps {
          sh 'docker run -d -p 80:9090 --name WebMain k8s-app-front . '
      }
    }
  }
}
