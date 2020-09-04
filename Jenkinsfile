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
            dockerImage = docker.build registry + ":$BUILD_NUMBER"
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
  stage('Delete Images') {
        steps {
          sh 'docker rm -fv --name WebMain'
      }
    }

    stage('Deploy Docker Images') {
        steps {
          sh 'docker run -d -p 80:9090 --name WebMain $registry:$BUILD_NUMBER'
      }
    }
  }
}
