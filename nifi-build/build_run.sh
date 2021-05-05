dname=$1
PORT=$2
set -x
mkdir -p ./output
chmod a+rw ./output
docker build -t nifi-$dname/alexandre .
docker run --rm --name nifi-$dname \
  -p $PORT:$PORT \
  -v $(pwd)/output:/opt/host-output \
  -d \
  --log-opt max-size=30m --log-opt max-file=10 \
  -e NIFI_WEB_HTTP_PORT=$PORT \
  nifi-$dname/alexandre:latest


