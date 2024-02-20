pipeline {
  agent any
  stages {
    stage('git scm update') {
      steps {
        git url: 'https://github.com/myeonghyun-7011/cicdtest.git', branch: 'master'
      }
    }
    stage('docker build and push') {
      steps {
        sh '''
        sudo docker build -t myeonghyun-7011/cicdtest:green .
        sudo docker push myeonghyun-7011/cicdtest:green
        '''
      }
    }
    stage('deploy and service') {
      steps {
        sh '''
        ansible master -m command -a 'kubectl create deploy web-green --replicas=3 --image=myeonghyun-7011/cicdtest:green'
        ansible master -m command -a 'kubectl expose deploy web-green --type=LoadBalancer --port=80 --target-port=80 --name=web-green-svc'
        '''
      }
    }
  }
}

