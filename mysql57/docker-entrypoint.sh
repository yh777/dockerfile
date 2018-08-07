#!/bin/bash
if [ -d /opt/mysql57/var/mysql ]
then
    /opt/mysql57/bin/mysqld_safe --user=mysql
else
    /opt/mysql57/bin/mysqld --initialize-insecure --basedir=/opt/mysql57/ --datadir=/opt/mysql57/var --user=mysql
    /opt/mysql57/bin/mysqld_safe --user=mysql
    /opt/mysql57/bin/mysql -e "use mysql;  update user set authentication_string = password('jZ3p14Q03gyB16a'),password_expired = 'N',password_last_changed = now() where user = 'root'; flush privileges"
fi
