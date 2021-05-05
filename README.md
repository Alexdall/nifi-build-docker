# nifi-build-docker

Files to build a docker image with Apache NIFI

# docker-nifi

## Important Info
The jdbc directory will be copied to the container. In this example we have an oracle, sqlserver and postgresql jdbc. 
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
```
## Or just run build_run.sh
