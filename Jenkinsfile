pipeline {
    agent none

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "mymaven"
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
                    echo "creating the package"
                    sh "mvn package"
                }
            }

        }
    }
}
