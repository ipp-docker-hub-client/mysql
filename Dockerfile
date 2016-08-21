FROM mysql/mysql-server:5.7

COPY my.cnf /etc/my.cnf
RUN chown -R 0:0 /var/lib/mysql

ENTRYPOINT ["/entrypoint.sh"]
CMD ["mysqld"]
