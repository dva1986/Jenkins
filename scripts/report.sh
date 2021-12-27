#!/bin/bash

docker run --rm --name maven -v $RESULT_PATH/target:/app/target/ -v $RESULT_PATH/allure-report:/app/allure-report/ dva1986/maven-tests:latest site