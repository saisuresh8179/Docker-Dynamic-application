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
          sh '''
          docker build -t testing . '''
        }
    }
    stage ('run the container') {
        steps {
          sh ''' docker run --name test_con -d -p 8085:8080 testing '''
        }
    }
    stage ('add docker hub repo tag to image') {
        steps {
          sh ''' docker tag testing saisuresh1/testing:v2 '''
        }
    }
    stage ('push to docker hub') {
        steps {
            script {
                withDockerRegistry(credentialsId: 'docker-cred') {
                    sh ''' docker push saisuresh1/testing:v2 '''
                }
            }
        }
    }
    stage ('create artifate for application') {
      steps {
        sh ''' mvn clean install '''
      }
    }
    stage ('store in nexus') {
      steps {
          nexusArtifactUploader artifacts: [
            [
              artifactId: '01-maven-web-app',
              classifier: '', 
              file: 'target/01-maven-web-app.war', 
              type: 'war'
            ]
          ],
          credentialsId: 'nexus-cred', 
          groupId: 'in.ashokit', 
          nexusUrl: '172.31.13.106:8081', 
          nexusVersion: 'nexus3', 
          protocol: 'http', 
          repository: 'sample_app', 
          version: '4.0'
     }
    }     
  }
}
