#!/usr/bin/env bash

if [ -d /home/ubuntu/app-lits-devops1 ]; then

  cd /home/ubuntu/app-lits-devops1
  pm2 kill

fi