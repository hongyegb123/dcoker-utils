#!/usr/bin/env bash

awk -F\' '$1=="menuentry " {print i++ " : " $2}' /etc/grub2.cfg

rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-3.el7.elrepo.noarch.rpm 

yum --enablerepo=elrepo-kernel install -y kernel-ml

awk -F\' '$1=="menuentry " {print i++ " : " $2}' /etc/grub2.cfg
grub2-editenv list
grub2-mkconfig -o /etc/grub2.cfg
grub2-set-default 0

echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
sysctl -p
