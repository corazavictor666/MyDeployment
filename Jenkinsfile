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
      withCredentials([usernamePassword( credentialsId: 'docker-hub-credentials', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
         docker.withRegistry('', 'docker-hub-credentials') {
            sh "docker login -u ${USERNAME} -p ${PASSWORD}"
            myImage.push("${env.BUILD_NUMBER}")
            myImage.push("latest")
            }   
      }

    }

    stage('Deploy App') {
      steps {
        sh 'kubectl apply -f backend.yaml' 
        
      }
    }

  }
}