# vim:set ft=dockerfile:

FROM alpine:3.7

ARG RUBY_VERSION=2.4.4-r0
ARG RUBY_JSON_VERSION=2.4.4-r0
ARG SU_EXEC_VERSION=0.2-r0
ARG COCOAPODS_VERSION=1.2.1
ARG OPENSSH_VERSION=7.5_p1-r8
ARG CURL_VERSION=7.59.0-r0
ARG GIT_VERSION=2.15.0-r1

RUN set -ex ; \
    apk add --update --no-cache \
      git="$GIT_VERSION" \
      curl="$CURL_VERSION" \
      openssh="$OPENSSH_VERSION" \
      ruby="$RUBY_VERSION" \
      ruby-json="$RUBY_JSON_VERSION" \
      su-exec="$SU_EXEC_VERSION" \
      ca-certificates && \
    addgroup -S cocoapods && \
    adduser -S cocoapods -G cocoapods

USER cocoapods

RUN set -ex ; \
    GEM_HOME=$HOME/.gem ; \
    PATH=$(ruby -rubygems -e "puts Gem.user_dir")/bin:$PATH ; \
    gem install cocoapods --user-install --no-rdoc --no-ri --no-document --version "$COCOAPODS_VERSION"

USER root

COPY build/usr/local/bin/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN set -ex ; \
    chmod 0755 /usr/local/bin/docker-entrypoint.sh && \
    mkdir /home/cocoapods/.cocoapods && \
    mkdir /home/cocoapods/project && \
    chown -R cocoapods:cocoapods /home/cocoapods

VOLUME [ "/home/cocoapods/.cocoapods" "/home/cocoapods/project" ]
WORKDIR /home/cocoapods/project
ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.sh" ]
CMD [ "--version" ]
