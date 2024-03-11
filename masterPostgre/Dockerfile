FROM postgres:latest
COPY . /docker-entrypoint-initdb.d
RUN chmod +x /docker-entrypoint-initdb.d/init-master.sh