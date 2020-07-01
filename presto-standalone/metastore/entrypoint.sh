#!/bin/sh

export HADOOP_VERSION=3.2.0
export METASTORE_VERSION=3.0.0

export HADOOP_HOME=/opt/hadoop-${HADOOP_VERSION}
export HIVE_HOME=/opt/apache-hive-metastore-${METASTORE_VERSION}-bin
export JAVA_HOME=/usr/local/openjdk-8

export HADOOP_CLASSPATH=${HADOOP_HOME}/share/hadoop/tools/lib/aws-java-sdk-bundle-1.11.375.jar:${HADOOP_HOME}/share/hadoop/tools/lib/hadoop-aws-3.2.0.jar

sed \
  -e "s|%HIVE_METASTORE_JDBC_URL%|${HIVE_METASTORE_JDBC_URL}|g" \
  -e "s|%HIVE_METASTORE_DRIVER%|${HIVE_METASTORE_DRIVER}|g" \
  -e "s|%HIVE_METASTORE_USER%|${HIVE_METASTORE_USER}|g" \
  -e "s|%HIVE_METASTORE_PASSWORD%|${HIVE_METASTORE_PASSWORD}|g" \
  -e "s|%S3_ENDPOINT%|${S3_ENDPOINT:-}|g" \
  -e "s|%S3_ACCESS_KEY%|${S3_ACCESS_KEY:-}|g" \
  -e "s|%S3_SECRET_KEY%|${S3_SECRET_KEY:-}|g" \
  -e "s|%S3_HIVE_WAREHOUSE_DIR%|${S3_HIVE_WAREHOUSE_DIR:-}|g" \
  ${HIVE_HOME}/conf/hive-site.xml.template > ${HIVE_HOME}/conf/hive-site.xml

/opt/apache-hive-metastore-3.0.0-bin/bin/schematool -initSchema -dbType postgres
/opt/apache-hive-metastore-3.0.0-bin/bin/start-metastore
