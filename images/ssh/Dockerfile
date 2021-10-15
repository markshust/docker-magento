FROM debian:buster-slim

ARG APP_ID=1000

RUN apt-get update && apt-get install -y ssh

RUN groupadd -g "$APP_ID" app \
  && useradd -g "$APP_ID" -u "$APP_ID" -d /var/www -s /bin/bash app

RUN echo 'app:app' | chpasswd

RUN service ssh start

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]
