# vim:set ft=dockerfile:

FROM alpine:3.7

ARG YARN_VERSION=1.6.0
ARG NODEJS_VERSION=8.9.3-r1

ARG GIT_VERSION=2.15.0-r1
ARG WGET_VERSION=1.19.2-r1
ARG OPENSSH_VERSION=7.5_p1-r8
ARG SU_EXEC_VERSION=0.2-r0

RUN set -ex ; \
    apk add --update --no-cache \
      nodejs="${NODEJS_VERSION}" \
      git="${GIT_VERSION}" \
      wget="${WGET_VERSION}" \
      openssh="${OPENSSH_VERSION}" \
      su-exec="${SU_EXEC_VERSION}" \
      ca-certificates && \
    apk add --no-cache --virtual .yarn-deps \
      gnupg && \
    addgroup -S yarn && \
    adduser -S yarn -G yarn && \
    \
    cd /tmp && \
      wget --progress=bar:force -O yarn.tar.gz "https://github.com/yarnpkg/yarn/releases/download/v${YARN_VERSION}/yarn-v${YARN_VERSION}.tar.gz" && \
      wget --progress=bar:force -O yarn.tar.gz.asc "https://github.com/yarnpkg/yarn/releases/download/v${YARN_VERSION}/yarn-v${YARN_VERSION}.tar.gz.asc" && \
      wget -qO- https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --import && \
      gpg --verify yarn.tar.gz.asc && \
      tar zvxf yarn.tar.gz && \
        mkdir /opt && \
        mv -fin "/tmp/yarn-v${YARN_VERSION}/" /opt/yarn && \
    \
    chown -R yarn:yarn /opt/yarn && \
    \
    apk del --purge .yarn-deps && \
    rm -rf /tmp/*

COPY build/usr/local/bin/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN set -ex ; \
    chmod 0755 /usr/local/bin/docker-entrypoint.sh && \
    mkdir /home/yarn/workspace && \
    mkdir -p /home/yarn/.yarn && \
    chown -R yarn:yarn /home/yarn

VOLUME [ "/home/yarn/.yarn", "/home/yarn/workspace" ]
WORKDIR /home/yarn/workspace
ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.sh" ]
CMD [ "version" ]
