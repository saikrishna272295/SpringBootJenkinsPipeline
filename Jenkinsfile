pipeline {
    agent any
    tools{
        jdk "jdk11"
        maven "Maven3.9.3"
    }

    stages {
        stage('Git Checkout') {
            steps {
               git branch: 'main', changelog: false, credentialsId: 'd008cf34-38a8-4246-a30f-0f6627aae542', poll: false, url: 'https://github.com/saikrishna272295/SpringBootJenkinsPipeline.git'
            }
        }
        stage('COMPILE') {
            steps {
               bat "mvn clean compile -DskipTests=true"
            }
        }
        stage('OWASPScan') {
            steps {
                dependencyCheck additionalArguments: '--scan ./', odcInstallation:'DepCheck'
                dependencyCheckPublisher pattern:'**/dependency-check-report.xml'
            }
        }
        stage('BUILD'){
            steps{
                bat "mvn clean package -DskipTests=true"
            }
        }
    }
}
