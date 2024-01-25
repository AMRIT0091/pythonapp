pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    // Print current directory
                    echo "Current Directory: ${pwd()}"

                    // Change to the correct working directory
                    dir('mypythonapp') {
                        // Your build commands go here
                        sh 'docker build -t mypythonapp:latest .'
                    }
                }
            }
        }
    }
}
