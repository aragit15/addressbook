pipeline {
    agent any

    //tools {
        // Install the Maven version configured as "M3" and add it to the path.
      //  maven "M3"
    //}

    stages {
        stage('compile') {
            steps {
                script{
                    echo "compiling the code"
                }
            }

        }
        stage('UnitTest') {
            steps {
                script{
                    echo "Running the test"
                }
            }

        }
        stage('Package') {
            steps {
                script{
                    echo "creating the package"
                }
            }

        }
    }
}
