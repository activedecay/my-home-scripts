#!/bin/sh
rm -rf BUILD_NUMBER
rm -rf fio-agent*.rpm
rm -rf fio-msrv*.rpm
wget http://jenkins/management-beryllium-packaging/LATEST/BUILD_NUMBER
BUILD_NUMBER=$(cat BUILD_NUMBER)
wget http://jenkins/management-beryllium-packaging/LATEST/Linux/sles-11/repo-ga/RPMS/fio-agent-3.9.0.${BUILD_NUMBER}-1.0.x86_64.rpm
wget http://jenkins/management-beryllium-packaging/LATEST/Linux/sles-11/repo-ga/RPMS/fio-msrv-3.9.0.${BUILD_NUMBER}-1.0.x86_64.rpm
rpm -Uvh fio-agent*.rpm fio-msrv*.rpm