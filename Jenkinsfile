pipeline {
  agent any
  stages {
    stage('CreateImage'){
       steps {
        echo "buiding docker images"
        sh '''
        original_pwd=$(pwd -P)
        ls
        cd src
        docker build -t localimg:$BUILD_NUMBER .
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
        docker container stop localinstance || true
        docker container rm localinstance || true
        docker container run -itd --name localinstance -p 8087:8080 localimg:$BUILD_NUMBER
    
        sh '''
       }
     }
      
}
}   
