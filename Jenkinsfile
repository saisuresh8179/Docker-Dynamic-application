pipeline {
  agent any
  stages {
    stage ('build docker image') {
        steps {
          sh '''  docker build -t java_app . '''
        }
    }
    stage ('run the docker container') {
        steps {
          sh ''' docker run --name java_con -d -p 8089:8080 java_app '''
        }
    }
    stage ('add docker hub repo tag to image') {
        steps {
          sh ''' docker tag java_app saisuresh1/java_app:v1 '''
        }
    }
    stage ('push to docker hub') {
        steps {
            script {
                withDockerRegistry(credentialsId: 'docker-cred') {
                    sh ''' docker push saisuresh1/java_app:v1'''
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
          nexusUrl: '172.31.42.187:8081', 
          nexusVersion: 'nexus3', 
          protocol: 'http', 
          repository: 'war_repo', 
          version: '2.0'
     }
    }     
  }
}
