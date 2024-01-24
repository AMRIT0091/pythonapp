pipeline {
  agent any
    stages {
      stage('BUild Application'){
        steps {
          sh 'mvn -f jenkins/mypythonapp/pom.xml clean package'
       }
       post {
        success {
          echo "we are archiving the artifact"
          archiveArtifacts artifacts: '**/*.war', followSymlinks: false
        }
       }
     }
    stage('CreateTomcatImage'){
       steps {
        copyArtifacts filter: '**/*.war', fingerprintArtifacts: true, projectName: env.JOB_NAME, selector: lastSuccessful()
        echo "buiding docker images"
        sh '''
        original_pwd=$(pwd -P)
        cd jenkins/mypythonapp
        docker build -t localtomcatimg:$BUILD_NUMBER .
        cd $original_pwd
        sh '''
       }
     }
     stage('deploy in QA instance'){
       steps {
        echo "we are deploying the app"
         timeout(time:2, unit:'MINUTES'){
           input message: 'Approve thre staging deployment'
         }
        sh '''
        docker container stop localtomcatinstance || true
        docker container rm localtomcatinstance || true
        docker container run -itd --name localtomcatinstance -p 8087:8080 localtomcatimg:$BUILD_NUMBER
    
        sh '''
       }
     }
      
}
}
