#!/usr/bin/env bash

cd /home/ubuntu/app-lits-devops1

APP_ENV=$DEPLOYMENT_GROUP_NAME

if [ $DEPLOYMENT_GROUP_NAME == "prodGreen" ] || [ $DEPLOYMENT_GROUP_NAME == "prodBlue" ] || [ $DEPLOYMENT_GROUP_NAME == "prod" ] ; then
    APP_ENV="prod"
fi

# launch application
npm run start-prod-api
sleep 10
npm run start-prod
sleep 10