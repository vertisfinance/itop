FROM ubuntu:16.04

RUN apt-get update && \
  apt-get -y install vim wget unzip mysql-client unzip apache2 php php-mysql php-ldap php-mcrypt php-cli php-soap php-json graphviz php-xml php-gd php-zip libapache2-mod-php
RUN a2enmod ssl

RUN mkdir -p /tmp/itop
RUN wget -O /tmp/itop/itop.zip https://sourceforge.net/projects/itop/files/itop/2.1.0/iTop-2.1.0-2127.zip
RUN unzip /tmp/itop/itop.zip -d /tmp/itop/
RUN mkdir -p /var/www/html/ && cp -r /tmp/itop/web/* /var/www/html/ && rm -rf /tmp/itop && rm /var/www/html/index.html

# RUN mkdir -p /tmp/combodo-email
# RUN wget -O /tmp/combodo-email-synchro.zip http://www.combodo.com/itop-extensions/ticket-from-email-2.6.12-138.zip
# RUN unzip /tmp/combodo-email-synchro.zip -d /tmp/combodo-email/
# RUN cp -r /tmp/combodo-email/* /var/www/html/extensions/ && rm -rf /tmp/combodo-email

RUN mkdir -p /tmp/email-reply
RUN wget -O /tmp/email-reply.zip http://www.combodo.com/itop-extensions/email-reply.zip
RUN unzip /tmp/email-reply.zip -d /tmp/email-reply/
RUN cp -r /tmp/email-reply/* /var/www/html/extensions/ && rm -rf /tmp/email-reply

RUN chown -R www-data:www-data /var/www/html

RUN ln -sf /proc/self/fd/1 /var/log/apache2/access.log
RUN ln -sf /proc/self/fd/1 /var/log/apache2/error.log

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

COPY php.ini /etc/php/7.0/apache2/
COPY php.ini /etc/php/7.0/cli/
COPY run.sh /etc/
RUN cp etc/run.sh /
