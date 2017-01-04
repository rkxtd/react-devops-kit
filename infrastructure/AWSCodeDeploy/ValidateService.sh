#!/usr/bin/env bash
HASH=`cat /home/ubuntu/app-lits-devops1/.commit-hash`

function notifySlack {
    status=$1
    emoji=$2
    webHookUrl="https://hooks.slack.com/services/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"
    slackChannel="deployments"

    if [ "$status" == "success" ] ; then
        color="#2FA44F"
    else
        color="#D50200"
    fi

    curl -X POST --data-urlencode 'payload={"channel": "#'$slackChannel'", "username": "CodeDeploy LITS-DevOps '$DEPLOYMENT_GROUP_NAME'", "attachments": [ { "color": "'$color'", "text": "<https://eu-west-1.console.aws.amazon.com/codedeploy/home?region=eu-west-1#/deployments/'$DEPLOYMENT_ID'|Deployment> '$status' on the instance. Commit: <https://github.com/rkxtd/react-devops-kit/commit/'$HASH'|'${HASH:0:7}'>" } ], "icon_emoji": "'$emoji'"}' $webHookUrl
}

function sendUrlToSlack {
    service=$1
    port=$2
    webHookUrl="https://hooks.slack.com/services/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"
    ec2Url=$(curl http://169.254.169.254/latest/meta-data/public-hostname)
    slackChannel="deployments"
    curl -X POST --data-urlencode 'payload={"channel": "#'$slackChannel'", "username": "CodeDeploy LIST-DevOps-app '$DEPLOYMENT_GROUP_NAME'", "attachments": [ { "text": "Service ['$service'] launched succesfully. URL: '$ec2Url':'$port'" } ] }' $webHookUrl
}
sleep 10
resultApi=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:3030/ping)
resultWeb=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:8080/)

if [[ "$resultApi" == "200" ]]; then
    sendUrlToSlack 'LIST-DevOps-api', '3030'
    if [[ "$resultWeb" == "200" ]]; then
      sendUrlToSlack 'LIST-DevOps-app', '8080'
      notifySlack 'success' ':yay:'
      exit 0
    else
      notifySlack 'failure' ':interrobang:'
      exit 1
    fi
else
    notifySlack 'failure' ':interrobang:'
    exit 1
fi