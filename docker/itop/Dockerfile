FROM ubuntu:focal-20210827
ENV DEBIAN_FRONTEND noninteractive

# locales plus other requiered packages
RUN apt-get update && \
  apt-get install -y locales wget mysql-client unzip apache2
RUN localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8
ENV TZ=Europe/Budapest
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get install -y  tzdata
RUN apt-get install -y  php7.4
RUN apt-get install -y  php7.4-mysql
RUN apt-get install -y  php7.4-ldap
RUN apt-get install -y  php7.4-cli
RUN apt-get install -y  php7.4-soap
RUN apt-get install -y  php7.4-json
RUN apt-get install -y  graphviz
RUN apt-get install -y  php7.4-xml
RUN apt-get install -y  php7.4-gd
RUN apt-get install -y  php7.4-zip
RUN apt-get install -y  libapache2-mod-php
RUN a2enmod ssl
RUN apt-get install  -y php7.4-mbstring
RUN apt-get install  -y php7.4-curl

RUN rm /var/www/html/index.html

RUN ln -sf /proc/self/fd/1 /var/log/apache2/access.log
RUN ln -sf /proc/self/fd/1 /var/log/apache2/error.log

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

RUN wget -O /itop.zip https://sourceforge.net/projects/itop/files/itop/2.7.0-2/iTop-2.7.0-2-5689.zip/download
RUN unzip itop.zip -d /var/www/html
RUN cp -r /var/www/html/web/* /var/www/html

RUN rm itop.zip && rm -rf /var/www/html/web
COPY html/conf /var/www/html/conf
COPY html/extensions /var/www/html/extensions
COPY html/env-production /var/www/html/env-production
COPY docker/itop/apache_conf/000-default.conf /etc/apache2/sites-available/000-default.conf

COPY docker/itop/php.ini /etc/php/7.2/apache2/
COPY docker/itop/php.ini /etc/php/7.2/cli/
COPY docker/itop/entrypoint.sh /
COPY docker/utils.sh /
COPY docker/secret.sh /

ENTRYPOINT ["./entrypoint.sh"]
