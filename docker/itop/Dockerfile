FROM ubuntu:bionic-20190424

RUN apt-get update
RUN apt-get install -y  wget
RUN apt-get install -y  mysql-client
RUN apt-get install -y  unzip
RUN apt-get install -y  apache2
ENV TZ=Europe/Budapest
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get install -y  tzdata
RUN apt-get install -y  php
RUN apt-get install -y  php-mysql
RUN apt-get install -y  php-ldap
RUN apt-get install -y  php-cli
RUN apt-get install -y  php-soap
RUN apt-get install -y  php-json
RUN apt-get install -y  graphviz
RUN apt-get install -y  php-xml
RUN apt-get install -y  php-gd
RUN apt-get install -y  php-zip
RUN apt-get install -y  libapache2-mod-php
RUN a2enmod ssl

RUN rm /var/www/html/index.html

RUN ln -sf /proc/self/fd/1 /var/log/apache2/access.log
RUN ln -sf /proc/self/fd/1 /var/log/apache2/error.log

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

RUN wget -O /itop.zip https://sourceforge.net/projects/itop/files/itop/2.6.1/iTop-2.6.1-4463.zip/download
RUN unzip itop.zip -d /var/www/html
RUN cp -r /var/www/html/web/* /var/www/html

RUN rm itop.zip && rm -rf /var/www/html/web
COPY html/conf /var/www/html/conf
COPY html/extensions /var/www/html/extensions
COPY html/env-production /var/www/html/env-production
COPY docker/itop/apache_conf/000-default.conf /etc/apache2/sites-available/000-default.conf

COPY docker/itop/php.ini /etc/php/7.0/apache2/
COPY docker/itop/php.ini /etc/php/7.0/cli/
COPY docker/itop/entrypoint.sh /
COPY docker/utils.sh /
COPY docker/secret.sh /

ENTRYPOINT ["./entrypoint.sh"]
