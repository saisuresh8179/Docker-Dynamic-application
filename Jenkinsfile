pipeline {
  agent any
  stages { 
    stage ('run ansible playbook') {
      steps {
        ansiblePlaybook( 
          credentialsId: 'ssh_private_key', 
          disableHostKeyChecking: true, 
          inventory: '/etc/ansible/hosts', 
          playbook: '/home/ansible/docker.yml'
        )
      }
    }
  }
}
