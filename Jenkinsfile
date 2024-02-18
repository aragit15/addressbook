pipeline {
    agent none

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "mymaven"
    }

    environment{
        BUILD_SERVER='ec2-user@172.31.2.236'
    }

    stages {
        stage('compile') {
            agent {label "linux_slave"}
            steps {
                script{
                    echo "compiling the code"
                    sh "mvn compile"
                }
            }

        }
        stage('UnitTest') {
            agent any
            steps {
                script{
                    echo "Running the test"
                    sh "mvn test"
                }
                
            }
            post{
                always{
                    junit 'target/surefire-reports/*.xml'
                }
            }

        }
        stage('Package') {
            agent any
            steps {
                script{
                    sshagent(['slave2']) {
                    sh "scp -o strictHostkey checking=no server-script.sh ${BUILD_SERVER}:/home/ec2-user"
                    sh "ssh -o strictHostkey checking=no ${BUILD_SERVER} 'bash server-script.sh'"
                    echo "creating the package"
                    sh "mvn package"
                }
            }

        }
    }
}
}    
    
