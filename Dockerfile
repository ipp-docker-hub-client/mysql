FROM ipropertygroup/base:latest

ENV MYSQL_MAJOR 5.7
ENV MYSQL_VERSION 5.7.14-1debian8
ENV DEBIAN_FRONTEND noninteractive

RUN mkdir /init.dbs
RUN apt-get update && apt-get install -y perl pwgen --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys A4A9406876FCBD3C456770C88C718D3B5072E1F5
RUN echo "deb http://repo.mysql.com/apt/debian/ jessie mysql-${MYSQL_MAJOR}" > /etc/apt/sources.list.d/mysql.list

RUN apt-get update && apt-get install -y mysql-server="${MYSQL_VERSION}" && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/lib/mysql && mkdir -p /var/lib/mysql /var/run/mysqld \
    && chown -R mysql:mysql /var/lib/mysql /var/run/mysqld \
    && chmod 775 /var/run/mysqld

ADD mysqld.cnf /etc/mysql/conf.d/
ADD init.sh /tmp/
RUN chmod +x /tmp/init.sh; /tmp/init.sh;

ENTRYPOINT ["mysqld", "--user", "root","--console"]
