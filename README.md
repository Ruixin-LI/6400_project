Make sure current work dir contains Dockerfile and docker-compose.yaml.

First build docker image with cmd: 
docker build -t intro_db .

Next start the network, with:
docker compose up -d

To interact with database, start a shell in DB container and run: psql -h localhost -p 5432 -U webadmin -d webport

Check all database with: \l
Select a database with: \c [database_name]
See all tables in the database with: \dt

The network should contain: a webserver, two mongoDB server, several clients