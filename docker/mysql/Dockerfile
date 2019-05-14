FROM mysql:5.7.26

# locales
RUN apt-get update
RUN apt-get install -y locales
RUN localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8


RUN apt-get update
RUN apt-get install -y python3-setuptools python3-pip
ENV PATH /python/bin:$PATH
ENV PYTHONUNBUFFERED 1

RUN pip3 install --no-cache-dir periodtask==0.5.4

COPY docker/mysql/my.cnf /etc/mysql/conf.d/my.cnf
COPY services/backup /
COPY docker/mysql/entrypoint.sh /my_entrypoint.sh
COPY docker/mysql/utils.sh /utils.sh

ENTRYPOINT ["./my_entrypoint.sh"]
