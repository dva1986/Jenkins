#!/bin/bash

docker run -d --net selenoid --name selenoid -p 4445:4444 -v /var/run/docker.sock:/var/run/docker.sock -v $PWD/:/etc/selenoid/:ro aerokube/selenoid:latest-release -conf /etc/selenoid/browsers.json -video-output-dir /opt/selenoid/video/ -timeout 3m0s -container-network selenoid
