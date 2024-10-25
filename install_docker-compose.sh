#!/usr/bin/env bash

COMPOSE_VERSION="1.26.1"
# COMPOSE_VERSION="master"

# Detect the Linux distribution
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$ID
    VERSION=$VERSION_ID
else
    echo "Unsupported distribution"
    exit 1
fi

install_docker_compose_centos() {
    yum install -y bash-completion
    curl -L https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
    curl -L https://raw.githubusercontent.com/docker/compose/${COMPOSE_VERSION}/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose${COMPOSE_VERSION}
}

install_docker_compose_ubuntu() {
    apt-get update
    apt-get install -y bash-completion
    curl -L https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
    curl -L https://raw.githubusercontent.com/docker/compose/${COMPOSE_VERSION}/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose${COMPOSE_VERSION}
}

install_docker_compose_debian() {
    apt-get update
    apt-get install -y bash-completion
    curl -L https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
    curl -L https://raw.githubusercontent.com/docker/compose/${COMPOSE_VERSION}/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose${COMPOSE_VERSION}
}

install_docker_compose_arch() {
    pacman -Syu --noconfirm
    pacman -S --noconfirm bash-completion
    curl -L https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
    curl -L https://raw.githubusercontent.com/docker/compose/${COMPOSE_VERSION}/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose${COMPOSE_VERSION}
}

install_docker_compose_suse() {
    zypper refresh
    zypper install -y bash-completion
    curl -L https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
    curl -L https://raw.githubusercontent.com/docker/compose/${COMPOSE_VERSION}/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose${COMPOSE_VERSION}
}

case "$OS" in
    centos)
        install_docker_compose_centos
        ;;
    ubuntu)
        install_docker_compose_ubuntu
        ;;
    debian)
        install_docker_compose_debian
        ;;
    arch)
        install_docker_compose_arch
        ;;
    opensuse)
        install_docker_compose_suse
        ;;
    *)
        echo "Unsupported distribution"
        exit 1
        ;;
esac
