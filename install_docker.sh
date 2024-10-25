#!/usr/bin/env bash

# Detect the Linux distribution
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$ID
    VERSION=$VERSION_ID
else
    echo "Unsupported distribution"
    exit 1
fi

install_docker_centos() {
    yum install -y yum-utils
    yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
    yum install -y docker-ce docker-ce-cli containerd.io
    systemctl start docker
    systemctl enable docker
}

install_docker_ubuntu() {
    apt-get update
    apt-get install -y apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    apt-get update
    apt-get install -y docker-ce
    systemctl start docker
    systemctl enable docker
}

install_docker_debian() {
    apt-get update
    apt-get install -y apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
    apt-get update
    apt-get install -y docker-ce
    systemctl start docker
    systemctl enable docker
}

install_docker_arch() {
    pacman -Syu --noconfirm
    pacman -S --noconfirm docker
    systemctl start docker
    systemctl enable docker
}

install_docker_suse() {
    zypper refresh
    zypper install -y docker
    systemctl start docker
    systemctl enable docker
}

case "$OS" in
    centos)
        install_docker_centos
        ;;
    ubuntu)
        install_docker_ubuntu
        ;;
    debian)
        install_docker_debian
        ;;
    arch)
        install_docker_arch
        ;;
    opensuse)
        install_docker_suse
        ;;
    *)
        echo "Unsupported distribution"
        exit 1
        ;;
esac
