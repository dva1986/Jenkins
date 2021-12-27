### Start jenkins

> docker run -d -p 8082:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home jenkins/jenkins:jdk11

> docker run -d -p 8082:8080 -p 50000:50000 -v /Users/test/demo-docker-jenkins:/home/jenkins/workspace/demo-docker-job -v jenkins_home:/var/jenkins_home jenkins/jenkins:jdk11
> docker run -d -p 8082:8080 -p 50000:50000 -v /home/vdomikan/projects/selenoid-dva196-jenkins/tmp:/home/jenkins/workspace -v jenkins_home:/var/jenkins_home jenkins/jenkins:jdk11
> docker run -d -p 8082:8080 -p 50000:50000 -v /home/vdomikan/projects/selenoid-dva196-jenkins/tmp:/home/jenkins/workspace -e WORKSPACE='/home/jenkins/workspace' -v jenkins_home:/var/jenkins_home jenkins/jenkins:jdk11

```
localhost:8082
```

### Start Allure Report service

> docker-compose -f docker-compose-allure.yml up -d

```
localhost:5252
```

### Selenoid url

```
http://localhost:8081/#/
```


### Useful comments

> docker run --user root -d -p 127.0.0.1:1234:1234 bobrik/socat TCP-LISTEN:1234,fork UNIX-CONNECT:/var/run/docker.sock

type=bind,source=/home/vdomikan/projects/selenoid-dva196-jenkins/tmp,destination=/home/jenkins
type=bind,source=/home/vdomikan/projects/selenoid-dva196-jenkins/tmp,target=/home/jenkins
type=bind,source=/home/vdomikan/projects/selenoid-dva196-jenkins/tmp-results,target=/tmp/results