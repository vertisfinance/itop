FROM ubuntu:16.04

RUN apt-get update && \
  apt-get -y install vim wget unzip mysql-client unzip apache2 php php-mysql php-ldap php-mcrypt php-cli php-soap php-json graphviz php-xml php-gd php-zip libapache2-mod-php
RUN a2enmod ssl

RUN rm /var/www/html/index.html

RUN ln -sf /proc/self/fd/1 /var/log/apache2/access.log
RUN ln -sf /proc/self/fd/1 /var/log/apache2/error.log

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

COPY docker/itop/php.ini /etc/php/7.0/apache2/
COPY docker/itop/php.ini /etc/php/7.0/cli/
COPY docker/itop/run.sh /etc/
RUN cp etc/run.sh /

RUN wget -O /itop.zip http://sourceforge.net/projects/itop/files/itop/2.1.0/iTop-2.1.0-2127.zip/download
RUN unzip itop.zip -d /var/www/html
RUN cp -r /var/www/html/web/* /var/www/html

RUN rm itop.zip && rm -rf /var/www/html/web
COPY html/conf /var/www/html/conf
COPY html/extensions /var/www/html/extensions
COPY html/env-production /var/www/html/env-production
RUN mkdir -p /var/www/html/data
RUN mkdir -p /var/www/html/log
COPY docker/itop/apache_conf/prod_000-default.conf /etc/apache2/sites-available/000-default.conf


RUN chmod 444 /var/www/html/conf/production/config-itop.php
RUN chown -R www-data:www-data /var/www/html/conf/production
RUN chown -R www-data:www-data /var/www/html/conf
RUN chown -R www-data:www-data /var/www/html/env-production
RUN chown -R www-data:www-data /var/www/html/data
RUN chown -R www-data:www-data /var/www/html/log
