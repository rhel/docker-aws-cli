FROM alpine:3.10
LABEL MAINTAINER="Artyom Nosov <chip@unixstyle.ru>"

RUN apk update \
 && apk add --no-cache \
      jq \
      python \
      groff \
      less \
      mailcap \
 && apk add --no-cache --virtual .build-deps \
      py-pip \
 && pip install --upgrade awscli s3cmd python-magic \
 && wget -O /usr/local/bin/ecs-cli https://amazon-ecs-cli.s3.amazonaws.com/ecs-cli-linux-amd64-latest \
 && chmod +x /usr/local/bin/ecs-cli \
 && apk --purge del .build-deps \
 && rm -fr /var/cache/apk/*

ENTRYPOINT ["aws"]
