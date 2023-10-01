pipeline {
  agent any
  stages { 
    stage ('copy artifcate to ansible sever'){ 
      steps {
         sshPublisher(publishers: [sshPublisherDesc(configName: 'ansible_sever', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: '', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '//home//ansible//Docker', remoteDirectorySDF: false, removePrefix: '/var/lib/jenkins/workspace/java_pipeline/target', sourceFiles: '/var/lib/jenkins/workspace/java_pipeline/target/*war')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
      }
    }
  }
}
