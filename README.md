# docker-centos-cloudera-5-3-1
docker-centos6-cloudera-5-3-1 is an attempt to create a docker equiv to the clouder quickstart. This is a stretch goal though because there are so many components, user roles and networking configurations required to get cloudera manager working that getting it to work inside a docker container is _very hard_ indeed. I tried a ton of the docker CM images, most fail miserably. This one at least installs completely.   

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
      -p 9001:9001 -p 8888:8888 -t claytantor/docker-centos6-cloudera-5-3-1:latest /bin/bash

# configuring 
when you run the manager startup you will need to set the directories for the datanodes, namenodes, secondary namenodes etc. because docker's device mapper confuses the manager's mappings. The dockerfile creates the directories and sets the perms to 777 (dubious approach, see TODOs) so that its a little easier during setup but the only way I have found to set these in manually during setup. Here are the dirs to use:

/var/cm/datanode1 - Datanode1
/var/cm/datanode2 - Datanode1
/var/cm/datanode3 - Datanode1
/var/cm/nn - Name Node
/var/cm/snn - Secondary Name Node
/var/cm/nm - NM dir
/var/cm/impala - Impala data dir
/var/cm/hive - Hive data dir
/var/cm/cloudera-host-monitor - Hostmontor data
/var/cm/cloudera-service-monitor - Service data dir
/var/cm/sqoop2 - Sqoop Data dir
/var/cm/zookeeper - Zookeeper data dir

# TODO
* vi /etc/sysconfig/network needs to have the hostname configured in /etc/hosts, restart networking 
* http://www.rackspace.com/knowledge_center/article/centos-hostname-change
* add chown for each data directoy so 777 is not required
