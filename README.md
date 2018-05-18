# omnicache-docker
Docker Example for AltitudeCDN OmniCache Deployment

This repository contains a prototype Dockerfile for AltitudeCDN OmniCache deployment.

Steps to build and test:

1) Ensure docker is installed for you build and deployment platfomr (e.g., for centos 'yum install docker')
2) Download the latest Oracle Java9 JRE (http://www.oracle.com/technetwork/java/javase/downloads/java-archive-javase9-3934878.html)  and save local to Dockerfile directory
3) Download the OmniCache software distribution (e.g., omnicache-v2.1.0-rtm.zip) and save local to Dockerfile directory
4) Build the docker image:

    $ docker build -t omnicache .
    
5) Run the docker image:

    $ docker run -d -ti -P -p 10000:10000 -p 10080:10080 omnicache:latest  "<ALTIMETER_URL>"  ["<ALTIMETER_PW>"]
    
NOTE: the ALTIMETER_URL (e.g., http://192.168.1.10:80) (required parameter) identifies the Altimeter that will manage the licensing and provisioining for the docker instance of OmniCache. The ALTIMETER_PW (optional parameter) if provided allows the OmniCache to automatically obtain a license from an appropriately provisioned Altimeter, if omitted the OmniCache license request will be placed in the provisioning approval queue and can be manually accepted from Altimeter OmniCache Provisioning screen.
    
