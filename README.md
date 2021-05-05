# nifi-build-docker

Files to build a docker image with Apache NIFI

# docker-nifi

## Intro 
This is a base docker which runs a determinated workflow in the same directory of the build. Copying it to the build image and starting as needed. 

## Important Info
The flow and other files will be copied to the container. In this example we have a jdbc for oracle along side. 
```
./flow.xml.gz
./jdbc/*
```

## Build 
```
$ docker build -t nifi-APP/alexdall .
```

## Run
```
$ docker run --name --rm nifi \
  -p 9090:9090 \
  -v $(pwd)/output:/opt/output \
  -d \
  -e NIFI_WEB_HTTP_PORT='9090' \
  nifi-APP/alexdall:latest
