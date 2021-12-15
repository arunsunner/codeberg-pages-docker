FROM alpine:edge
MAINTAINER Arun Sunner <arun@sndbxd.com> 

WORKDIR /home
RUN apk update && apk upgrade && apk add --no-cache bash ca-certificates curl git go openssl
RUN git clone --branch main https://codeberg.org/Codeberg/pages-server codeberg-pages

WORKDIR ./codeberg-pages
RUN /usr/bin/go build

CMD ["/home/codeberg-pages/pages"]