#!/usr/bin/env bash

# Docker remove <none> TAG images (https://stackoverflow.com/questions/33913020/docker-remove-none-tag-images)
# How to remove old and unused Docker images (https://stackoverflow.com/a/32723127/6309)
# Docker remove <none> TAG images
# docker image prune
# docker images -q -a | xargs docker inspect --format='{{.Id}}{{range $rt := .RepoTags}} {{$rt}} {{end}}'|grep -v ':'
# docker rmi $(docker images --filter "dangling=true" -q --no-trunc)


yum install -y yum-utils

yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

yum install -y docker-ce docker-ce-cli containerd.io

systemctl start docker

systemctl enable docker
