pipeline{

    agent any

    stages{

        stage('Build Jar'){
            steps{
                sh "mvn clean package -DskipTests"
            }
        }

        stage('Build Image'){
            steps{
             sh "docker build -t=diyanich/selenium ."
            }
        }

        stage('Push Image'){
            environment{
            DOCKER_HUB = credentials('dockerhub-credentials')
            }
            steps{
            sh "echo ${DOCKER_HUB_PSW} | docker login -u ${DOCKER_HUB_USR} --password-stdin"
            sh "docker push diyanich/selenium"
            }
        }
    }
    post{
        always{
        sh "docker logout"
        }
    }
}