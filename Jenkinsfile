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
        stage('Docker Build & Push') {
            steps {
                script{
                    withDockerRegistry(credentialsId: '19b0657e-e142-41e7-930e-84d2d2bdd1ae') {
                        bat "docker build -t springboot-jenkins-pipeline -f Dockerfile ."
                        bat "docker tag  springboot-jenkins-pipeline krishmaddali/springboot-jenkins-pipeline:latest"
                        bat "docker push krishmaddali/springboot-jenkins-pipeline:latest"
                    }
                }
            }
        }
    }
}
