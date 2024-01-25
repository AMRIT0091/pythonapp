pipeline {
  agent {
    label 'amrit-slave-node'
  }
  stages {
    stage('CreateImage'){
       steps {
        echo "buiding docker images"
        sh '''
        original_pwd=$(pwd -P)
        ls
        cd /home/amrit/workspace/python-pipeline-project
        docker build -t localimg:$BUILD_NUMBER .
        cd $original_pwd
        sh '''
       }
     }
     stage('deploy in QA instance'){
       agent {
    label 'builtin-node'
  }
       steps {
        echo "we are deploying the app"
         timeout(time:2, unit:'MINUTES'){
           input message: 'Approve thre staging deployment'
         }
        sh '''
        docker container stop localinstance || true
        docker container rm localinstance || true
        docker container run -itd --name localinstance -p 5000:8080 localimg:$BUILD_NUMBER
    
        sh '''
       }
     }
      
}
}   
