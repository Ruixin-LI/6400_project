Make sure current work dir contains Dockerfile and docker-compose.yaml.

First build docker image with cmd: 
docker build -t intro_db_ui .

Next start the network, with:
docker compose up .

The network should contain: a webserver, two mongoDB server, several clients

For reuse purpose, change the client id and secret in ./pages/api/auth/[...nextauth].js, also chose another secret