#!/bin/bash

echo "$PWD/target"
docker run --rm --name maven -v $PWD/target:/app/target/ -v $PWD/allure-report:/app/allure-report/ maven site