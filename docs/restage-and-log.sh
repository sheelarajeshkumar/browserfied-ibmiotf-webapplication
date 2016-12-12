#!/bin/bash
# Information steps:
# 1) chmod u+x restage-and-log.sh
# 2) ./restage-and-log.sh
# cf api https://api.eu-gb.bluemix.net UK
# cf api https://api.ng.bluemix.net US

user="YOUR BLUEMIX ID"
bluemix_api="https://api.YOUR BLUEMIX API"
organization_name="YOUR BLUEMIX ORGANIZATION"
space_name="YOUR BLUEMIX SPACE"
application_name="YOUR BLUEMIX APPLICATION NAME"

echo "--> Ensure to deploy into the right bluemix region"
echo "Insert your password:"
# How to input a password in bash shell
# http://stackoverflow.com/questions/3980668/how-to-get-a-password-from-a-shell-script-without-echoing
read -s password
cd ..
cf login -a $bluemix_api -u $user -p $password -o $organization_name -s $space_name

echo "--> Starting push and log CF $application_name"

echo "****** show existing apps *********"
cf apps
echo "******* push to CF ********"
cf restage  $application_name
echo "******* start CF logging ********"
cf logs  $application_name
