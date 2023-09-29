pipeline {
  agent any
  stages { 
    stage ('run ansible playbook') {
      steps {
        ansiblePlaybook credentialsId: 'ansible_sever',
          disableHostKeyChecking: true, 
          installation: 'ansible', 
          inventory: '/etc/ansible/hosts',
          playbook: '/home/ansible/docker.yml'
      }
    }
  }
}
