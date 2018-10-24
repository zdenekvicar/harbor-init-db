# harbor-init-db
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