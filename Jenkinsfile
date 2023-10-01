pipeline {
  agent any
  stages { 
    stage ('copy artifcate to ansible sever'){ 
      steps {
        sshPublisher(publishers: [sshPublisherDesc(configName: 'ansible_connection', sshCredentials: [encryptedPassphrase: '{AQAAABAAAAAQICv9sq9d/FmUP7kec4abvo09bh5KTkfzj7efNcYLAPs=}', key: '', keyPath: '', username: 'ansible'], transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: '', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '//home//ansible//Docker', remoteDirectorySDF: false, removePrefix: 'target', sourceFiles: 'target/01-maven-web-app.war')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])  
      }
    }
  }
}
