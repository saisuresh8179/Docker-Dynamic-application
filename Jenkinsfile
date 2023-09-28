pipeline {
  agent any
  stages {
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
          version: '1.0'
     }
    }     
  }
}
