pipeline {
  agent any
  stages {
    stage ('checkout') {
        steps {
          git branch: 'main', url: 'https://github.com/saisuresh8179/Dynamic-application.git'
        }
    }
    stage ('build docker image') {
        steps {
          sh ''' docker build -t testing . '''
        }
    }
    stage ('run the container') {
        steps {
          sh ''' docker run --name test_con -d -p 8085:8080 testing '''
        }
    }
    stage ('add docker hub repo tag to image') {
        steps {
          sh ''' docker tag testing saisuresh1/testing:v1 '''
        }
    }
    stage ('push to docker hub') {
        steps {
            script {
                withDockerRegistry(credentialsId: 'docker-cred') {
                    sh ''' docker push saisuresh1/testing:v1 '''
                }
            }
        }
    }
  }
}
