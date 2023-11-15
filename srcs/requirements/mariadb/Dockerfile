FROM alpine:latest
RUN apk add --no-cache mariadb mariadb-client
COPY default.cnf /etc/mysql/my.cnf
COPY docker_entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker_entrypoint.sh
ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD [ "mysqld_safe" ]