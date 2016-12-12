#!/usr/bin/env bash

# Script to start selenium server for protractor tests.
# Information steps:
# 1) chmod u+x start-selenium.sh
# 2) ./start-selenium.sh

echo "--> Start a local webserver for selenium"
bin_path=`dirname $0`
pushd $bin_path/.. > /dev/null

echo "--> cmd 'webdriver-manager start'"
node_modules/protractor/bin/webdriver-manager start

# In case the selenium server does not stop after testing:
# Type the following link into a browser:
# http://localhost:4444/selenium-server/driver/?cmd=shutDownSeleniumServer

popd > /dev/null
