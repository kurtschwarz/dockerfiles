# vim:set ft=dockerfile:

FROM alpine:3.7

ARG PHP_VERSION=7.1.16-r1
ARG COMPOSER_VERSION=1.6.4
ARG COMPOSER_VERSION_SHA256=8d0d9246f68532cc8fd6a47a58d195f0c849d26430f93c397a3176fc2d971ded

ARG GIT_VERSION=2.15.0-r1
ARG WGET_VERSION=1.19.2-r1
ARG OPENSSH_VERSION=7.5_p1-r8
ARG SU_EXEC_VERSION=0.2-r0

RUN set -ex ; \
    apk add --update --no-cache \
      php7="${PHP_VERSION}" \
      php7-phar="${PHP_VERSION}" \
      php7-curl="${PHP_VERSION}" \
      php7-json="${PHP_VERSION}" \
      php7-mbstring="${PHP_VERSION}" \
      php7-openssl="${PHP_VERSION}" \
      git="${GIT_VERSION}" \
      wget="${WGET_VERSION}" \
      openssh="$OPENSSH_VERSION" \
      su-exec="${SU_EXEC_VERSION}" \
      ca-certificates && \
    addgroup -S composer && \
    adduser -S composer -G composer

RUN set -ex ; \
    cd /tmp && \
      wget --progress=bar:force -O composer.phar "https://getcomposer.org/download/${COMPOSER_VERSION}/composer.phar" && \
      echo "${COMPOSER_VERSION_SHA256} *composer.phar" | sha256sum -c -; \
    mv composer.phar /usr/local/bin/composer && \
    chmod 0755 /usr/local/bin/composer

COPY build/usr/local/bin/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN set -ex ; \
    chmod 0755 /usr/local/bin/docker-entrypoint.sh && \
    mkdir /home/composer/workspace && \
    mkdir -p /home/composer/.composer/cache && \
    chown -R composer:composer /home/composer

VOLUME [ "/home/composer/.composer/cache", "/home/composer/workspace" ]
WORKDIR /home/composer/workspace
ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.sh" ]
CMD [ "-V" ]
