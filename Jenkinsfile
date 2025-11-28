pipeline{

    agent any

    stages{

        stage('Build Jar'){
            steps{
                sh " mvn clean package -DskipTests"
            }
        }

        stage('Build Image'){
            steps{
             sh "docker build -t=diyanich/selenium ."
            }
        }

        stage('Push Image'){
            steps{
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