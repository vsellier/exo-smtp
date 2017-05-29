#FROM alpine:3.3
FROM debian:8.0

ARG POSTFIX_UID=1000

RUN useradd -u ${POSTFIX_UID} -s /bin/false postfix && apt-get update && apt-get install -y postfix rsyslog

COPY entrypoint.sh /

RUN chmod u+x entrypoint.sh && sed -i 's|/var/log/mail|/var/log/mail/mail|g' /etc/rsyslog.conf

ENTRYPOINT /entrypoint.sh

EXPOSE 25

