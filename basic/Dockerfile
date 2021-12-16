FROM nginx:1.21.4-alpine
# FROM laravelsail/php74-composer:latest

WORKDIR /usr/share/nginx/html

## COPY nginx config
COPY conf/default.conf /etc/nginx/conf.d/default.conf 

RUN apk update && \
    apk add --no-cache \
        bash \
        curl \
        make \
        openrc \
        openssl \
        php7 \
        php7-fpm \
        php7-cli \
        php7-mysqli \
        php7-cli \
        php7-iconv \
        php7-mbstring \
        php7-mcrypt \
        php7-phar \
        php7-dom \
        php7-xml \
        php7-fileinfo \
        php7-xmlwriter \
        php7-tokenizer \
        php7-json && \
    wget https://phar.phpunit.de/phpunit-9.phar -O /usr/local/bin/phpunit && \
    chmod +x /usr/local/bin/phpunit && \
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php -r "if (hash_file('sha384', 'composer-setup.php') === '906a84df04cea2aa72f40b5f787e49f22d4c2f19492ac310e8cba5b96ac8b64115ac402c8cd292b8a03482574915d1a8') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer && \
    php -r "unlink('composer-setup.php');" && \
    /usr/local/bin/composer create-project --prefer-dist laravel/laravel && \
    cd laravel && \ 
    composer install && \
    chown nginx:nginx -R laravel




