FROM debian:stable-slim

LABEL maintainer="Victor R. Santos <victor-rds@users.noreply.github.com>"

ENV BASE_DIR /data
ENV TARGET_DIR /target

WORKDIR ${BASE_DIR}

RUN set -eux; \
    apt-get update; \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends duc lighttpd; \
    chown www-data:www-data /data; \
    chmod g+s /data; \
    rm -rf /var/lib/apt/lists/*;

COPY --chown=root:root cgi.conf /etc/lighttpd/conf-enabled/10-cgi.conf
COPY --chown=root:root scan.sh /usr/local/bin/scan.sh
COPY --chown=www-data:www-data duc.cgi /usr/lib/cgi-bin/duc.cgi

VOLUME ["/data"]

EXPOSE 80

CMD [ "/usr/sbin/lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf" ]
    