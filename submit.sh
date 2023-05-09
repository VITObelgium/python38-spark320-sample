#!/bin/bash
export SPARK_HOME=/opt/spark3_2_0/

export SPARK_DIST_CLASSPATH="$($HADOOP_HOME/bin/hadoop classpath)"

$SPARK_HOME/bin/spark-submit --master yarn --deploy-mode=cluster \
--conf spark.yarn.appMasterEnv.YARN_CONTAINER_RUNTIME_DOCKER_MOUNTS=/var/lib/sss/pipes:/var/lib/sss/pipes:rw,/usr/hdp/:/usr/hdp/:ro,/etc/hadoop/conf/:/etc/hadoop/conf/:ro,/etc/krb5.conf:/etc/krb5.conf:ro \
--conf spark.yarn.appMasterEnv.YARN_CONTAINER_RUNTIME_TYPE=docker \
--conf spark.yarn.appMasterEnv.YARN_CONTAINER_RUNTIME_DOCKER_IMAGE=vito-docker.artifactory.vgt.vito.be/python38-spark320 \
--conf spark.executorEnv.YARN_CONTAINER_RUNTIME_TYPE=docker \
--conf spark.executorEnv.YARN_CONTAINER_RUNTIME_DOCKER_IMAGE=vito-docker.artifactory.vgt.vito.be/python38-spark320 \
--conf spark.executorEnv.YARN_CONTAINER_RUNTIME_DOCKER_MOUNTS=/var/lib/sss/pipes:/var/lib/sss/pipes:rw,/usr/hdp/:/usr/hdp/:ro,/etc/hadoop/conf/:/etc/hadoop/conf/:ro,/etc/krb5.conf:/etc/krb5.conf:ro \
--conf spark.yarn.appMasterEnv.PYSPARK_PYTHON=/bin/python3 \
--conf spark.executorEnv.PYSPARK_PYTHON=/bin/python3 \
pi.py
