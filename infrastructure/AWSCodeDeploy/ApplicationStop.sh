#!/usr/bin/env bash

if [ -d /home/ubuntu/app-lits-devops1 ]; then

  cd /home/ubuntu/app-lits-devops1
  npm run kill-prod

  # clear caches
  rm -Rf /tmp/cache/

fi