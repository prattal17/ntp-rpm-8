#ARG IMAGE="centosStream8"

#---
# Place anything that is common to both the build and execution environment in base 
#

FROM quay.io/centos/centos:stream8 AS base

SHELL ["/bin/bash", "-c"]

#Need to add this to install this group to install the RPM development packages
RUN dnf group install -y "Development Tools" 
RUN dnf install -y rpmdevtools rpmlint nano vim tree
RUN dnf --enablerepo=powertools -y install lynx
RUN dnf install -y glibc-langpack-en

WORKDIR /root

RUN rpmdev-setuptree

#RUN curl -L https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2.8p17.tar.gz -o ntp-4.2.8p17.tar.gz
#RUN tar xvz -f ntp-4.2.8p17.tar.gz

RUN curl -L https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2.8p17.tar.gz -o ~/rpmbuild/SOURCES/ntp-4.2.8p17.tar.gz

RUN curl -L https://raw.githubusercontent.com/prattal17/ntp-rpm-8/main/ntp.spec -o ~/rpmbuild/SPECS/ntp.spec

RUN QA_SKIP_BUILD_ROOT=1 rpmbuild -ba ~/rpmbuild/SPECS/ntp.spec

#RUN cp ~/rpmbuild/RPMS /outsideWorld

#RUN QA_SKIP_BUILD_ROOT=1 rpmbuild -ba ~/rpmbuild/SPECS/ntp.spec 