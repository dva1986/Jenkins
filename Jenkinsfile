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
     }
    }

    stage('Debug') {
     steps {
      sh 'ls -la'
      sh 'java -version'
      sh 'ls -a ${WORKSPACE}'

     }
    }

//     stage('Generate Report') {
//      steps {
//       sh 'sh scripts/report.sh'
//      }
//     }
  }
  post {
      always {
        allure([
            includeProperties: false,
            jdk: '',
            properties: [],
            reportBuildPolicy: 'ALWAYS',
            results: [[path: '${WORKSPACE}/target/allure-results']]
        ])
      }
    }
}