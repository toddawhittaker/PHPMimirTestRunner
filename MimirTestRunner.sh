#!/bin/bash
wget -q https://raw.githubusercontent.com/toddawhittaker/PHPMimirTestRunner/master/bin.zip
unzip -q bin.zip
chmod a+x bin/*
mv bin/* /bin

# simple syntax check
for file in *.php; do
  status="$(php -l $file 2>&1)"
  if [ $? -ne 0 ]; then
    echo "$status" > DEBUG
    echo 0 > OUTPUT
    exit 1
  fi
done

phpunit.phar --log-junit output.xml . > DEBUG
tests=$(grep '<testcase' output.xml | wc -l)
failures=$(grep '<failure' output.xml | wc -l)
errors=$(grep '<error' output.xml | wc -l)
((passing = $tests - $failures - $errors))
((score = $passing * 100 / $tests))
echo "You passed $passing out of $tests, earning $score%% of points"
echo "$score" > OUTPUT