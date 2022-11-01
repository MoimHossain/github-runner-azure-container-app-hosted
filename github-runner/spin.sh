#!/bin/bash
GHUSER=$GHUSER
REPO=$REPO
PAT=$PAT

RUNNER_NAME="RUNNER-$(hostname)"

TOKEN=$(curl -sX POST -H "Accept: application/vnd.github.v3+json" -H "Authorization: token ${PAT}" https://api.github.com/repos/${GHUSER}/${REPO}/actions/runners/registration-token | jq .token --raw-output)
cd /home/docker/actions-runner
./config.sh --unattended --url https://github.com/${GHUSER}/${REPO} --token ${TOKEN} --name ${RUNNER_NAME} --ephemeral 
# --disableupdate

cleanup() {
    echo "Removing runner..."
    ./config.sh remove --unattended --token ${TOKEN}
}

trap 'cleanup; exit 130' INT
trap 'cleanup; exit 143' TERM

./run.sh & wait $!