# docker-centos-cloudera-5-3-1
docker-centos6-cloudera-5-3-1


## building
    docker build -t claytantor/docker-centos6-cloudera-5-3-1:latest .

## running
    docker run --privileged=true -i -p 49122:22 -p 2181:2181 -p 7180:7180 \
      -p 7182:7182 -p 50010:50010 -p 50075:50075 -p 50020:50020 -p 8020:8020 \
      -p 50070:50070 -p 50090:50090 -p 8032:8032 -p 8030:8030 -p 8031:8031 \
      -p 8033:8033 -p 8088:8088 -p 8040:8040 -p 8042:8042 -p 8041:8041 \
      -p 10020:10020 -p 19888:19888 -p 41370:41370 -p 38319:38319 \
      -p 10000:10000 -p 21050:21050 -p 25000:25000 -p 25010:25010 \
      -p 25020:25020 -p 18080:18080 -p 7077:7077 -p 7078:7078 -p 9000:9000 \
      -p 9001:9001 -t claytantor/docker-centos6-cloudera-5-3-1:latest /bin/bash

# TODO
set swapiness to 0 = http://askubuntu.com/questions/103915/how-do-i-configure-swappiness
make datanode, nn, and snn directories for user hdfs, make sm directory in /var/lib/hadoop-yarn for yarn 
vi /etc/sysconfig/network needs to have the hostname configured in /etc/hosts, restart networking http://www.rackspace.com/knowledge_center/article/centos-hostname-change

