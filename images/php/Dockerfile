FROM dhawton/base

RUN addgroup -S application && adduser -SG application application

RUN apk update && \
    apk-install php7-pdo \
    php7-pdo_mysql \
    php7-curl \
    php7-redis \
    php7-dom \
    php7-xml \
    php7-json \
    php7-phar \
    php7-gmp \
    php7-zlib \
    php7-tokenizer \
    php7-openssl \
    php7-session \
    php7-ctype \
    php7-mbstring \
    php7-fpm \
    php7

COPY ./app.ini /usr/local/etc/php/conf.d
