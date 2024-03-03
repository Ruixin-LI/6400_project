#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
  CREATE ROLE replica_user REPLICATION LOGIN PASSWORD '123456';
  ALTER SYSTEM SET wal_level = replica;
  ALTER SYSTEM SET max_wal_senders = 3;
  ALTER SYSTEM SET max_replication_slots = 3;
EOSQL

# Append the configuration for replication to the pg_hba.conf
echo "host replication replica_user 192.168.0.0/16 trust" >> "/var/lib/postgresql/data/pg_hba.conf"

pg_ctl reload
