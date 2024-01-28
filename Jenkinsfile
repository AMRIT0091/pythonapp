pipeline {
  agent any
  stages {
    stage('CreateImage'){
       steps {
        echo "buiding docker images"
        sh '''
        original_pwd=$(pwd -P)
        ls
        cd /home/amrit/workspace/python-pipeline-project
        docker build -t mycalculater:$BUILD_NUMBER .
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
        docker container stop mycalculater-app || true
        docker container rm mycalculater-app || true
        docker run -d --name mycalculater-app -p 8090:80 mycalculater:$BUILD_NUMBER
    
        sh '''
       }
     }
      
}
}   
