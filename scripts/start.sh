#!/bin/bash

# we need to make a fully conical version of the hostname for the agent
HOSTNAME="$(hostname)"
IP_ADDRESS="$(hostname -i)"
echo "${IP_ADDRESS} ${HOSTNAME}.localdomain.net ${HOSTNAME}">/root/hosts
cat /root/hosts_base>>/root/hosts
cp /root/hosts /etc/hosts

chown hdfs:hadoop -R /usr/local/hadoop_store
chmod 777 -R /usr/local/hadoop_store

# start services
/etc/init.d/ntpd start
/etc/init.d/cloudera-scm-server-db start
/etc/init.d/cloudera-scm-agent start
/etc/init.d/cloudera-scm-server start
