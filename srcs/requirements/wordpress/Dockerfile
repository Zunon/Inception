FROM alpine:3.18
RUN apk update
RUN apk add --no-cache \
    php \
    php-fpm \
    php-mysqli \
    php-json \
    php-openssl \
    php-curl \
    php-zlib \
    php-xml \
    php-phar \
    php-intl \
    php-dom \
    php-xmlreader \
    php-ctype \
    php-mbstring \
    php-gd \
    curl \
	mysql-client
RUN mkdir -p /var/www/
RUN adduser -u 82 -D -S -G www-data www-data
RUN curl -o wordpress.tar.gz -fSL "https://wordpress.org/latest.tar.gz" \
    && tar -xzf wordpress.tar.gz -C /var/www/ \
    && rm wordpress.tar.gz \
    && chown -R www-data:www-data /var/www/
COPY php.conf /etc/php81/php-fpm.d/www.conf
RUN echo "clear_env = no" >> /etc/php81/php-fpm.conf
COPY docker_entrypoint.sh /usr/local/bin/
COPY install_wp.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/install_wp.sh
RUN chmod +x /usr/local/bin/docker_entrypoint.sh
ENTRYPOINT ["docker_entrypoint.sh"]
CMD ["php-fpm", "-F"]
