#!/usr/bin/env bash

aws deploy create-deployment \
  --application-name "LITS-DevOps" \
  --s3-location "bucket=lits-devops1,key=deployments/$1,bundleType=tgz" \
  --deployment-group-name "$2" \
  --deployment-config-name "CodeDeployDefault.OneAtATime" --region "eu-west-1"
