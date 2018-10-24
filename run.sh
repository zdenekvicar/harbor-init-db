#!/bin/sh                                                                

export PGPASSWORD=$PSQL_PASSWD

psql -h $PSQL_DBHOST -U $PSQL_USERNAME -d $PSQL_DBNAME -f 'harbor-init-scripts/initial-registry.sql'
psql -h $PSQL_DBHOST -U $PSQL_USERNAME -d $PSQL_DBNAME -f 'harbor-init-scripts/initial-notarysigner.sql'
psql -h $PSQL_DBHOST -U $PSQL_USERNAME -d $PSQL_DBNAME -f 'harbor-init-scripts/initial-notaryserver.sql'
psql -h $PSQL_DBHOST -U $PSQL_USERNAME -d $PSQL_DBNAME -f 'harbor-init-scripts/initial-clair.sql'

echo 'PostgreSQL init-db process complete.'
