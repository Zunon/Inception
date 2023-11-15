FROM alpine:3.18
RUN apk add mariadb
RUN mariadb-install-db --user=root --datadir=/var/lib/mysql --skip-test-db
RUN mkdir /run/mysqld
COPY ./init_db.sql docker_entrypoint.sh /etc/

ENTRYPOINT ["sh", "/etc/docker_entrypoint.sh"]