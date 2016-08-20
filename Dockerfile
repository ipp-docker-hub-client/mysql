FROM mysql:latest

ENV DEBIAN_FRONTEND noninteractive
ENV MYSQL_ALLOW_EMPTY_PASSWORD true

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["mysqld","--user=root"]

RUN ps -aux
