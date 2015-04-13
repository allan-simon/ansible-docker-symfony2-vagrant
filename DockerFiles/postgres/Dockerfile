# vim:set ft=dockerfile:
FROM library/postgres

MAINTAINER SIMON Allan <simona@gobeta.com.cn>

ADD make_db.sh /docker-entrypoint-initdb.d/
RUN chmod +x /docker-entrypoint-initdb.d/make_db.sh 
