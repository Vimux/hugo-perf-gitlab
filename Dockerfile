ARG ALPINE_VERSION="3.8"
FROM alpine:${ALPINE_VERSION}

ARG HUGO_VERSION="0.46"
ARG MINIFY_VERSION="2.3.5"

RUN set -eux && \
  apk add --update --no-cache \
      ca-certificates \
      openssl \
      git && \
  wget -O ${HUGO_VERSION}.tar.gz https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz && \
  wget -O ${MINIFY_VERSION}.tar.gz https://github.com/tdewolff/minify/releases/download/v${MINIFY_VERSION}/minify_${MINIFY_VERSION}_linux_amd64.tar.gz && \
  tar xz -f ${HUGO_VERSION}.tar.gz -C /usr/local/bin/ hugo && \
  tar xz -f ${MINIFY_VERSION}.tar.gz -C /usr/local/bin/ minify && \
  rm -rf  ${HUGO_VERSION}.tar.gz && \
  rm -rf  ${MINIFY_VERSION}.tar.gz && \
  rm -rf /tmp/* /var/cache/apk/*

EXPOSE 1313

CMD ["/usr/local/bin/hugo"]
