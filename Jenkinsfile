pipeline {
  agent any
  stages { 
    // stage ('build docker image') {
    //     steps {
    //       sh '''  docker build -t java_app . '''
    //     }
    // }
    // stage ('run the docker container') {
    //     steps {
    //       sh ''' docker run --name java_con1 -d -p 8085:8080 java_app '''
    //     }
    // }
    // stage ('add docker hub repo tag to image') {
    //     steps {
    //       sh ''' docker tag java_app saisuresh1/java_app:v2 '''
    //     }
    // }
    // stage ('push to docker hub') {
    //     steps {
    //         script {
    //             withDockerRegistry(credentialsId: 'docker-cred') {
    //                 sh ''' docker push saisuresh1/java_app:v2'''
    //             }
    //         }
    //     }
    // }
    stage ('create artifate for application') {
      steps {
        sh ''' mvn clean install '''
      }
    }
    stage ('store in nexus repo') {
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
          repository: 'war-repo-1', 
          version: '2.2'
     }
    }
    stage ('copy artifcate to ansible sever'){ 
      steps {
        sshPublisher(publishers: [sshPublisherDesc(configName: 'ansible_connection', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: 'ansible-playbook /home/ansible/Docker/docker.yml', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '//home//ansible//Docker', remoteDirectorySDF: false, removePrefix: 'target', sourceFiles: 'target/01-maven-web-app.war')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
        }
    }
  }
}
