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
        sh './scripts/clear.sh'
      }
    }
    stage('Clone') {
     steps {
       git([url: 'https://github.com/mariiavynnyk/HomeProject.git', branch: 'main'])
     }
    }
    stage('Run') {
     steps {
      sh 'hostname -i'
      sh 'docker ps'
      sh './scripts/build.sh'
//       sh 'pwd'
//       sh 'ls -la'
      sh './scripts/run.sh'
      sh 'echo "http://127.0.0.1:8081"'
      sh './scripts/run-tests.sh'
//       sh 'du target'
      sh './scripts/generate-report.sh'
//       sh 'du target'
//       sh 'du allure-report'
      sh 'ls -la'
      sh 'pwd'
     }
    }
//     stage('Clean up') {
//       steps {
//         sh './scripts/clear.sh'
//       }
//     }
  }
}