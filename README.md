# Docker Setup Instructions
## Prerequisites
- Ensure the current working directory contains `Dockerfile` and `docker-compose.yaml`.
- All shell scripts should have execution permissions.
## Build docker image with cmd: 
```shell
docker build -t intro_db .
```
## Start the compose network:
```shell
docker compose up -d
```
## To interact with database, start a shell in DB container and run: 
```shell
psql -h localhost -p 5432 -U webadmin -d webport
```
## Check all database with: 
```shell
\l
```
## Select a database with: 
```shell
\c [database_name]
```
## See all tables in the database with:
```shell
\dt
``` 
## Result:
The network should contain: a webserver, two mongoDB server, several clients