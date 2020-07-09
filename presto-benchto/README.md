# presto-benchto
Setup standalone Presto and Benchto service to run tpch and tpcds benchmarks. A self-contained Presto, Hive Metastore, S3(minio) and benchto service. 
The setup instructions are borrowed from https://github.com/prestosql/benchto/tree/master/benchto-service

* source env
* docker-compose up
* create environment and tag as described in the follow on sections.
* follow instructions in runenv folder.



## Creating environment

To create environment PRESTO-DEVENV you need to run:

```
$ curl -H 'Content-Type: application/json' -d '{
    "dashboardType": "grafana",
    "dashboardURL": "http://localhost:3000/dashboard/db/presto-devenv",
    "prestoURL": "http://presto-master:8080/"
}' http://localhost:8081/v1/environment/PRESTO-DEVENV
```

## Creating tag

To create tag for environment PRESTO-DEVENV you need to run:

```
$ curl -H 'Content-Type: application/json' -d '{
    "name": "Short tag desciption",
    "description": "Very long but optional tag description"
}' http://localhost:8081/v1/tag/PRESTO-DEVENV

```