FROM mysql:latest

ENV DEBIAN_FRONTEND noninteractive
ENV MYSQL_ALLOW_EMPTY_PASSWORD true

ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 3306
CMD ["mysqld","--user=root"]
