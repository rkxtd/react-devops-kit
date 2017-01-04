#!/usr/bin/env bash

cd /home/ubuntu/app-lits-devops1
npm install --production

# Upload assets
#ASSETS_PATH='/abs_path_to_assets'
#ASSETS_FOLDER=`ls $ASSETS_PATH`
#aws s3 sync --acl=public-read $ASSETS_PATH/$ASSETS_FOLDER/ s3://assets/bucket
