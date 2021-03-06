#!/usr/bin/env bash

COMPOSE_VERSION="1.26.1"
# COMPOSE_VERSION="master"

yum install -y bash-completion

curl -L https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

curl -L https://raw.githubusercontent.com/docker/compose/${COMPOSE_VERSION}/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose${COMPOSE_VERSION}
