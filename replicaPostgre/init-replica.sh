#!/bin/bash
set -e

echo "Waiting for master to start..."
while ! pg_isready -h pgreMasterDB -p 5432 -U webadmin; do
  sleep 1
done

echo "Master started, initializing replica..."

pg_basebackup -h pgreMasterDB -D /var/lib/postgresql/data -U $POSTGRES_USER -v -P --wal-method=stream -R

chown -R postgres:postgres /var/lib/postgresql/data
chmod 0700 /var/lib/postgresql/data
# Start the PostgreSQL server as the 'postgres' user.
su  postgres -c "exec postgres"