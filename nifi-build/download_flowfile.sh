dname=$1
docker cp nifi-$dname:/opt/nifi/nifi-current/conf/flow.xml.gz .
chmod a+rw flow.xml.gz
ls -larth flow.xml.gz
