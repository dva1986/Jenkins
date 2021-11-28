#!/bin/bash

docker run -d --net selenoid --name selenoid-ui -p 8081:8080 aerokube/selenoid-ui:latest-release --selenoid-uri http://selenoid:4444