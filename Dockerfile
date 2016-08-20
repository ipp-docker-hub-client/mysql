FROM docker pull mysql/mysql-server:5.7

COPY my.cnf /etc/my.cnf

ENTRYPOINT ["/entrypoint.sh"]
CMD ["mysqld"]
