pipeline {
    agent any
    stages {
    stage ('maven package')
        {
            steps {
                sh ''' mvn clean install '''
            }
        }
    stage ('build docker image') 
    {
        steps {
          sh '''  docker build -t java_app . '''
        }
    }
    stage ('run the docker container') 
    {
        steps {
          sh ''' docker run --name java_con1 -d -p 8085:8080 java_app '''
        }
    }
    stage ('add docker hub repo tag to imag   ') 
    {
        steps {
          sh ''' docker tag java_app saisuresh1/java_app:v2 '''
        }
    }
    stage ('push to docker hub') 
    {
        steps {
            script {
                withDockerRegistry(credentialsId: 'docker-cred') {
                    sh ''' docker push saisuresh1/java_app:v2'''
                }
            }
        }
    }
        // Continues Integration
    

        stage ('store to nexus repo')
        {
            steps {
                
                nexusArtifactUploader artifacts: 
                [
                    [
                        artifactId: '01-maven-web-app', 
                        classifier: '', 
                        file: 'target/01-maven-web-app.war', 
                        type: 'war'
                    ]
                ], 
                credentialsId: 'nexus_cred', 
                groupId: 'saisuresh', 
                nexusUrl: '172.31.29.220:8081', 
                nexusVersion: 'nexus3', 
                protocol: 'http', 
                repository: 'java_war_repo', 
                version: '1.0'            
            }
        }
        // Continues Deployment
        stage ('copy the Dockerfile to ansible sever')
        {
            steps {
              sshPublisher(publishers: [sshPublisherDesc(configName: 'ansible_server', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: '', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '//home//ansible//Docker', remoteDirectorySDF: false, removePrefix: '', sourceFiles: 'Dockerfile')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
           }
        }
        stage ('copy the artifate file to ansible server')
        {
            steps {
                sshPublisher(publishers: [sshPublisherDesc(configName: 'ansible_server', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: '', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '//home//ansible//Docker', remoteDirectorySDF: false, removePrefix: 'target', sourceFiles: 'target/01-maven-web-app.war')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
            }
        }
        stage ('copy the ansible-playbook for create docker image ans run container in ansible sever')
        {
            steps {
                sshPublisher(publishers: [sshPublisherDesc(configName: 'ansible_server', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: 'ansible-playbook /home/ansible/Docker/docker_image.yml', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '//home//ansible//Docker', remoteDirectorySDF: false, removePrefix: '', sourceFiles: 'docker_image.yml')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
            }
        }
    }
}
