pipeline {
    agent any
    stages {
        stage ('checkout') {
            steps {
                git 'https://github.com/saisuresh8179/Dynamic-application.git'
            }        
        }
        stage ('run image') {
            steps {
                sh ''' docker build -t webapp_java . '''
            }
        }
        stage ('push image') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'docker-hub') {
                        sh '''
                        docker tag webapp_java saisuresh1/webapp_java:0.0.1.RELEASE
                        docker push saisuresh1/webapp_java:0.0.1.RELEASE
                        '''
                    } 
                }
                
            }
        }
        stage ('run container') {
            steps {
                sh '''
                    docker run --name webapps_java_container -d -p 8001:8080 webapp_java:latest
                '''
            }
        }
    }
}
