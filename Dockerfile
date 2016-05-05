FROM golang:alpine

RUN apk add --update \
        bash \
        git \
    && rm -rf /var/cache/apk/* \
    && go get github.com/bitly/oauth2_proxy

EXPOSE 4180

CMD /go/bin/oauth2_proxy \
    -email-domain=sheltonplace.com \
    -cookie-secret=123 \
    -client-id=myclientid \
    -client-secret=456 \
    -http-address="http://0.0.0.0:4180" \
    -upstream=http://nginx:80
