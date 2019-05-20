FROM mysql:5.7.26

# locales
RUN apt-get update
RUN apt-get install -y locales
RUN localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8


<<<<<<< HEAD
=======
RUN apt-get update
>>>>>>> 79032b8abf5915118813de20607fe77349b14764
RUN apt-get install -y python3-setuptools python3-pip
ENV PATH /python/bin:$PATH
ENV PYTHONUNBUFFERED 1

<<<<<<< HEAD
RUN pip3 install --no-cache-dir periodtask==0.7.0
=======
RUN pip3 install --no-cache-dir periodtask==0.5.4
>>>>>>> 79032b8abf5915118813de20607fe77349b14764

COPY docker/mysql/my.cnf /etc/mysql/conf.d/my.cnf
COPY services/backup /
COPY docker/mysql/entrypoint.sh /my_entrypoint.sh
<<<<<<< HEAD
COPY docker/utils.sh /utils.sh
COPY docker/secret.sh /secret.sh
=======
COPY docker/mysql/utils.sh /utils.sh
>>>>>>> 79032b8abf5915118813de20607fe77349b14764

ENTRYPOINT ["./my_entrypoint.sh"]
