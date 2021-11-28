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
      sh 'ls -la'
      sh 'cat $(pwd)/browsers.json'
      sh 'cat $PWD/browsers.json'
      sh 'docker run -d --net selenoid --name selenoid -p 4445:4444 --mount type=bind,source=$(pwd),target=/etc/selenoid -v /var/run/docker.sock:/var/run/docker.sock aerokube/selenoid:latest-release -conf /etc/selenoid/browsers.json -video-output-dir /opt/selenoid/video/ -timeout 3m0s -container-network selenoid'
      sh 'docker logs selenoid'
      sh 'docker run -d --net selenoid --name selenoid-ui -p 8081:8080 aerokube/selenoid-ui:latest-release --selenoid-uri http://selenoid:4444'
      sh 'docker logs selenoid-ui'
      sh 'echo "http://127.0.0.1:8081"'
      sh 'sh scripts/run-tests.sh'
//       sh 'du target'
      sh 'sh scripts/generate-report.sh'
//       sh 'du target'
//       sh 'du allure-report'
     }
    }
//     stage('Clean up') {
//       steps {
//         sh 'sh scripts/clear.sh'
//       }
//     }
  }
}