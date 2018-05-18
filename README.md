# omnicache-docker
Docker Example for AltitudeCDN OmniCache Deployment

This repository contains a prototype Dockerfile for AltitudeCDN OmniCache deployment.

Steps to build and test:

1) Ensure docker is installed for you build and deployment platfomr (e.g., for centos 'yum install docker')
2) Download the latest Oracle Java9 JRE (http://www.oracle.com/technetwork/java/javase/downloads/java-archive-javase9-3934878.html)
3) Download the OmniCache software distribution (e.g., omnicache-v2.1.0-rtm.zip)
4) Build the docker image:

    $ docker build -t omnicache .
    
5) Run the docker image:

    $ docker run -d -ti -p 10000:10000 -p 10080:10080 omnicache:latest  "<ALTIMETER_URL>"  ["<ALTIMETER_PW>"]
    
