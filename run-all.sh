#!/bin/bash

echo "--------------------------------------------------------- clear"
sh scripts/clear.sh

echo "--------------------------------------------------------- build"
sh scripts/build.sh

echo "--------------------------------------------------------- run"
sh scripts/run.sh

echo "--------------------------------------------------------- run-tests"
sh scripts/run-tests.sh

echo "--------------------------------------------------------- generate allure report"
sh scripts/generate-report.sh

echo "--------------------------------------------------------- clear"
sh scripts/clear.sh
