FROM debian:buster-slim

RUN apt-get update
RUN apt-get install -y locales
# RUN apt-get clean
# 
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen en_US.UTF-8 && \
    /usr/sbin/update-locale LANG=en_US.UTF-8

RUN apt-get install -y sqlite3

ADD backend backend
ADD assets/backend.db assets/backend.db
ADD web web

ENTRYPOINT ["./backend"]
