# ntp-rpm-8
A way to build an rpm for ntp on version 8 of the RHEL Ecosystem

I will be using Docker as the development environment and Centos Stream 8 as the base image. The resulting RPM should hopefully work for RHEL 8 also.

The Centos 8 image on DockerHub is deprecated. To download the docker image of Centos Stream 8, visit this website: https://quay.io/repository/centos/centos?tab=tags

The name of the image is found by clicking "Fetch Tag" on the far side of the page. The image name I used is called "quay.io/centos/centos:stream8".

I downloaded the latest version of the NTP Package from their HTTP archive: https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/

As of this writing ( July 25 2023), the most recent stable version is 4.2.8p17.

Docker run Command: docker run -it ntprpm8




