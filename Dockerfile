FROM php:5.4-apache

RUN chown -R www-data:www-data /var/www/html

RUN ln -snf /usr/share/zoneinfo/America/Detroit /etc/localtime && echo 'America/Detroit' > /etc/timezone
RUN printf '[PHP]\ndate.timezone = "America/Detroit"\n' > /usr/local/etc/php/conf.d/tzone.ini

ADD php.ini /usr/local/etc/php.ini

RUN apt-get update
RUN apt-get install -y --force-yes libbz2-dev libcurl4-openssl-dev libfreetype6-dev libjpeg62-turbo-dev libpng-dev libxslt1-dev zip
RUN docker-php-ext-configure gd --with-gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/
RUN docker-php-ext-install bz2 calendar exif gettext mbstring mysql mysqli pcntl pdo_mysql shmop sockets wddx xsl zip gd
