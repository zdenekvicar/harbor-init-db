# harbor-init-db

Created for [harbor release-1.6.0](https://github.com/goharbor/harbor/tree/release-1.6.0) and [harbor-helm v0.3.0](https://github.com/goharbor/harbor-helm/tree/0.3.0).

Image was created to perform initial DB setup for usage in harbor. It connects to PostgreSQL database and creates required databases:
- registry
- clair
- notaryserver
- notarysigner

## How does it work
Docker container expects 4 environment variables, which are later used to setup connection string to DB:
- PSQL_PASSWD={database password}
- PSQL_DBNAME={initial database to connect to, i.e. 'postgres'}
- PSQL_DBHOST={databse hostname}
- PSQL_USERNAME={database username}

Once started, container executes run.sh script, which will run 4 init sql scripts towards PostgreSQL database.

## Kubernetes
For usage in kubernetes world, you can use example harbor-init-db.yml

```YAML
---
apiVersion: v1
kind: Pod
metadata:
  name: harbor-init-db
  namespace: harbor-init-db #ns has to be created before, or changed to existing one
spec:
  containers:
  - image: zdenekvicar/harbor-init-db:v1.6.0
    name: harbor-init-db
    env:
    - name: PSQL_PASSWD
      value: {database password}
    - name: PSQL_DBNAME
      value: {initial database to connect to, i.e. 'postgres'}
    - name: PSQL_DBHOST
      value: {databse hostname}
    - name: PSQL_USERNAME
      value: {database username}
```
