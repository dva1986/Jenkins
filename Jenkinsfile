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
       git([url: 'https://github.com/mariiavynnyk/HomeProject.git', branch: 'main'])
     }
    }
    stage('Run') {
     steps {
      sh 'hostname -i'
      sh 'docker ps'
      sh 'sh scripts/build.sh'
      sh 'sh scripts/run-selenoid.sh'
      sh 'sh scripts/run-selenoid-ui.sh'
      sh 'docker logs selenoid'
      sh 'docker logs selenoid-ui'
      sh 'echo "http://127.0.0.1:8081"'
      sh 'sh scripts/run-tests.sh'
//       sh 'du target'
      sh 'sh scripts/generate-report.sh'
//       sh 'du target'
//       sh 'du allure-report'
      sh 'ls -la'
      sh 'pwd'
     }
    }
//     stage('Clean up') {
//       steps {
//         sh 'sh scripts/clear.sh'
//       }
//     }
  }
}