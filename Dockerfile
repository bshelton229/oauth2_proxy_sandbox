FROM alpine

RUN apk add --update \
        bash \
        curl \
    && rm -rf /var/cache/apk/* \
    && curl -o /oauth2_proxy.tar.gz -L \
        https://github.com/bitly/oauth2_proxy/releases/download/v2.0.1/oauth2_proxy-2.0.1.linux-amd64.go1.4.2.tar.gz \
    && tar -zxf /oauth2_proxy.tar.gz -C / \
    && mv /oauth2_proxy-2.0.1.linux-amd64.go1.4.2/oauth2_proxy /usr/local/bin/oauth2_proxy \
    && rm -rf /oauth2_proxy*

EXPOSE 4180

CMD /usr/local/bin/oauth2_proxy \
    -cookie-secret=123 \
    -client-id=myclientid \
    -client-secret=456 \
    -http-address="http://0.0.0.0:4180" \
    -upstream=http://nginx:80
