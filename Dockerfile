FROM alpine:3.10

RUN apk add --no-cache \
      python \
      groff \
      less \
      mailcap \
 && apk add --no-cache --virtual .build-deps \
      py-pip \
 && pip install --upgrade awscli s3cmd python-magic \
 && apk --purge del .build-deps \
 && rm -fr /var/cache/apk/*

ENTRYPOINT ["aws"]
