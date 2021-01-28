dname=$1
PORT=$2
set -x
mkdir -p ./output
chmod a+rw ./output
docker build -t nifi-$dname/alexdall .
docker run --rm --name nifi-$dname \
  -p $PORT:$PORT \
  -v $(pwd)/output:/opt/host-output \
  -d \
  -e NIFI_WEB_HTTP_PORT=$PORT \
  nifi-$dname/alexdall:latest


