pipeline{
    agent any
    stages{
        stage('Clone Source Code'){
            steps{
                git 'https://github.com/jibolaolu/votingappproj.git'
            }
        }
        stage('Add key ring'){
            steps {
                sh 'eval `ssh-agent -s`'
            }
        }
        stage('Build Docker Image'){
            steps{
                ansiblePlaybook credentialsId: 'private-key', disableHostKeyChecking: true, installation: 'ansible', inventory: '/var/lib/jenkins/workspace/testansible/inventory', playbook: '/var/lib/jenkins/workspace/testansible/build.yml'
            }
        }
        stage('Start the WebServer'){
            steps {
                ansiblePlaybook credentialsId: 'private-key', disableHostKeyChecking: true, installation: 'ansible', inventory: '/var/lib/jenkins/workspace/testansible/inventory', playbook: '/var/lib/jenkins/workspace/testansible/webserver.yml'
            }
        }
        stage('Run Redis Database'){
            steps{
                ansiblePlaybook credentialsId: 'private-key', disableHostKeyChecking: true, installation: 'ansible', inventory: '/var/lib/jenkins/workspace/testansible/inventory', playbook: '/var/lib/jenkins/workspace/testansible/redis-servera.yml'
                ansiblePlaybook credentialsId: 'private-key', disableHostKeyChecking: true, installation: 'ansible', inventory: '/var/lib/jenkins/workspace/testansible/inventory', playbook: '/var/lib/jenkins/workspace/testansible/redis-serverb.yml'
            }
        }
        stage('Build Voting App'){
            steps {
                ansiblePlaybook credentialsId: 'private-key', disableHostKeyChecking: true, installation: 'ansible', inventory: '/var/lib/jenkins/workspace/testansible/inventory', playbook: '/var/lib/jenkins/workspace/testansible/appservera.yml'
                ansiblePlaybook credentialsId: 'private-key', disableHostKeyChecking: true, installation: 'ansible', inventory: '/var/lib/jenkins/workspace/testansible/inventory', playbook: '/var/lib/jenkins/workspace/testansible/appserverb.yml'
            }
        }
        stage('Run Monitoring Tools'){
            steps {
                ansiblePlaybook credentialsId: 'private-key', disableHostKeyChecking: true, installation: 'ansible', inventory: '/var/lib/jenkins/workspace/testansible/inventory', playbook: '/var/lib/jenkins/workspace/testansible/monitoring.yml'
            }
        }
    }
}