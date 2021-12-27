#!/bin/bash

#docker run --rm --name maven -v $PWD/target:/app/target/ -v $PWD/allure-report:/app/allure-report/ dva1986/maven-tests:latest site
docker run --rm --name maven -v /tmp/results/target:/app/target/ -v /tmp/results/allure-report:/app/allure-report/ dva1986/maven-tests:latest site