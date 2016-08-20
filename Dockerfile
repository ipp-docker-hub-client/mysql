FROM mysql/mysql-server:5.7

ENV DEBIAN_FRONTEND noninteractive
ENV MYSQL_ALLOW_EMPTY_PASSWORD true

RUN sed -i "s/mysql/root/g" /etc/my.cnf

ENTRYPOINT ["entrypoint.sh"]
CMD ["mysqld"]
