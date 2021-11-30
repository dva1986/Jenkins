### Start jenkins

> docker run -d -p 8082:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home jenkins/jenkins:jdk11

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