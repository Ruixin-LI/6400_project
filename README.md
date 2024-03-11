# Docker Setup Instructions
## Prerequisites
- Ensure the current working directory contains `Dockerfile` and `docker-compose.yaml`.
- All shell scripts should have execution permissions.
- The end line character on linux and windows are different, on linux it is '\n' but on windows it is '\n\r'. So if you are using windows, check if the git is set to automatically convert line end character to windows still, check it with
```shell
git config core.autocrlf
```
If that return true, means git will auto replace endline char for windows, and if you try to execute that file with linux shell it may cause trouble, remove all '\r' character with this cmd to run in linux:
```shell
sed -i 's/\r$//' *.sh
```
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