pipeline {
    agent any 

    stages {
        stage('Build') { 
            steps { 
                sh 'docker build -t srbino/calculator_for_k8s .' 
            }
        }
        stage('Push') { 
            steps { 
                withCredentials([string(credentialsId: 'docker-hub-credentials', variable: 'DOCKERHUB_TOKEN')]) {
                    sh 'echo "$DOCKERHUB_TOKEN" | docker login -u srbino --password-stdin'
                    sh 'docker push srbino/calculator_for_k8s'
                }
            }
        }
    }
}
