FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    nginx \
    php-fpm \
    php-mysql \
    curl \
    file \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/php

RUN rm -rf /var/www/html/*

COPY ./html /var/www/html
COPY ./html /var/concentration/html

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD php-fpm7.4 -F & nginx -g "daemon off;"


