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
      sh 'docker network create selenoid --subnet 172.37.40.0/24'
      sh 'docker run -d --net selenoid --name selenoid -p 4445:4444 -v /var/run/docker.sock:/var/run/docker.sock dva1986/selenoid -conf /etc/selenoid/browsers.json -video-output-dir /opt/selenoid/video/ -timeout 3m0s -container-network selenoid'
      sh 'docker run -d --net selenoid --name selenoid-ui -p 8081:8080 aerokube/selenoid-ui:latest-release --selenoid-uri http://selenoid:4444'
      sh 'echo "http://127.0.0.1:8081"'
      sh 'sh scripts/run-tests.sh'
      sh 'docker run --rm --name maven -v $PWD/target:/app/target/ -v $PWD/allure-report:/app/allure-report/ dva1986/maven-tests:latest site'
     }
    }
//     stage('Clean up') {
//       steps {
//         sh 'sh scripts/clear.sh'
//       }
//     }
  }
}