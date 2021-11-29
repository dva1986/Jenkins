pipeline {
  agent {
    label 'demo-docker-jenkins'
  }
  stages {
    stage('Initialize') {
      steps {
        script {
         def dockerHome = tool 'myDocker'
         env.PATH = "${dockerHome}/bin:${env.PATH}"
        }
        sh 'sh scripts/clear.sh'
      }
    }
    stage('Clone') {
     steps {
       git([url: 'https://github.com/dva1986/Jenkins.git', branch: 'main'])
     }
    }
    stage('Run') {
     steps {
      sh 'sh scripts/build.sh'
      sh 'sh scripts/run.sh'
      sh 'echo "http://127.0.0.1:8081"'
     }
    }
    stage('Tests') {
     steps {
      sh 'sh scripts/run-tests.sh'
     }
    }
    stage('Report') {
     steps {
      sh 'sh scripts/report.sh'
     }
    }
  }
}