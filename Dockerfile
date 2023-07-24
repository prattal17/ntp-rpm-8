#ARG IMAGE="centosStream8"

#---
# Place anything that is common to both the build and execution environment in base 
#

FROM quay.io/centos/centos:stream8 AS base

SHELL ["/bin/bash", "-c"]

#Need to add this to install this group to install the RPM development packages
RUN dnf group install -y "Development Tools" 
RUN dnf install -y rpmdevtools rpmlint 
RUN dnf --enablerepo=powertools -y install lynx

WORKDIR /root

RUN rpmdev-setuptree

RUN curl -L https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2.8p17.tar.gz -o ~/rpmbuild/SOURCES/ntp-4.2.8p17.tar.gz
