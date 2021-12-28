pipeline {
  agent {
    label 'demo-docker-jenkins'
  }
  environment {
//         DOCKER_HOST='tcp://host.docker.internal:1234'
//         RESULT_PATH='/Users/test/test_results'

        RESULT_PATH='/tmp/results'
   }
  stages {
//     stage('Setup parameters') {
//         steps {
//             script {
//                 properties([
//                     parameters([
//                         string(
//                             defaultValue: '/tmp/results',
//                             name: 'RESULT_PATH',
//                             trim: true
//                         )
//                     ])
//                 ])
//             }
//         }
//     }

    stage('Initialize') {
      steps {
        script {
         def dockerHome = tool 'myDocker'
         env.PATH = "${dockerHome}/bin:${env.PATH}"
        }
        sh 'echo $RESULT_PATH'
        sh 'sh scripts/clear.sh'
      }
    }
    stage('Clone') {
     steps {
       git([url: 'https://github.com/dva1986/Jenkins.git', branch: 'main'])
     }
    }
    stage('Build') {
     steps {
      sh 'sh scripts/build.sh'
     }
    }
    stage('Run Selenoid') {
     steps {
      sh 'sh scripts/run-selenoid.sh'
      sh 'echo "http://127.0.0.1:8081"'
     }
    }
    stage('Run Tests') {
     steps {
      sh 'sh scripts/run-tests.sh'
      sh 'ls -la'
      sh 'ls /tmp/results/target/allure-results'
     }
    }
//     stage('Generate Report') {
//      steps {
//       sh 'sh scripts/report.sh'
//      }
//     }
  }

  post('Publish report') {
     always {
        script {
           allure([
              includeProperties: false,
              jdk: '',
              properties: [],
              reportBuildPolicy: 'ALWAYS',
              report: '/tmp/results/allure-report',
              results: [[path: '/tmp/results/target/allure-results']]
           ])
        }
     }
  }
}