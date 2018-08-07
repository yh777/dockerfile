FROM centos
RUN yum -y install gcc gcc-c++ autoconf automake zlib* libxml* ncurses-devel libmcrypt* libtool* cmake make && yum clean all && rm -rf /var/cache/yum/*
RUN useradd -M -s /bin/false mysql
RUN mkdir /opt/soft
COPY mysql-boost-5.7.22.tar.gz /opt/soft/
WORKDIR /opt/soft/
RUN tar -zxf mysql-boost-5.7.22.tar.gz
RUN cd /opt/soft/mysql-5.7.22 && cmake \
-DCMAKE_INSTALL_PREFIX=/opt/mysql57 \
-DMYSQL_DATADIR=/opt/mysql57/var \
-DSYSCONFDIR=/etc \
-DWITH_MYISAM_STORAGE_ENGINE=1 \
-DWITH_INNOBASE_STORAGE_ENGINE=1 \
-DWITH_MEMORY_STORAGE_ENGINE=1 \
-DWITH_READLINE=1 \
-DMYSQL_UNIX_ADDR=/opt/mysql57/var/mysql.sock \
-DMYSQL_TCP_PORT=3306 \
-DENABLED_LOCAL_INFILE=1 \
-DWITH_PARTITION_STORAGE_ENGINE=1 \
-DEXTRA_CHARSETS=all \
-DDEFAULT_CHARSET=utf8 \
-DDEFAULT_COLLATION=utf8_general_ci \
-DDOWNLOAD_BOOST=OFF \
-DWITH_BOOST=/opt/soft/mysql-5.7.22/boost/boost_1_59_0/ \
&& make && make install

RUN rm -rf /opt/soft
COPY docker-entrypoint.sh /
CMD [ "/docker-entrypoint.sh" ]
EXPOSE 3306
VOLUME /opt/mysql57/var
