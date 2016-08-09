FROM php:7.0-apache

MAINTAINER Tim Weyand <tim.weyand@klambt.de>

# Setting Environment
RUN export LANGUAGE=de_DE.UTF-8 && \
      export LANG=de_DE.UTF-8 && \
      export LC_ALL=de_DE.UTF-8 && \
      DEBIAN_FRONTEND=noninteractive

# install the PHP extensions we need
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y libpng12-dev libjpeg-dev libpq-dev wget \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
    && docker-php-ext-install gd mbstring opcache pdo pdo_mysql pdo_pgsql zip

RUN a2enmod rewrite

### PAGESPEED ####
RUN wget https://dl-ssl.google.com/dl/linux/direct/mod-pagespeed-beta_current_amd64.deb
RUN dpkg -i mod-pagespeed-*.deb
RUN rm -f mod-pagespeed-*.deb
RUN apt-get -f install -y
RUN chmod 777 /var/cache/mod_pagespeed
RUN chmod 777 /var/log/pagespeed


RUN { \
		echo 'opcache.memory_consumption=256'; \
		echo 'opcache.interned_strings_buffer=8'; \
		echo 'opcache.max_accelerated_files=4000'; \
		echo 'opcache.revalidate_freq=60'; \
		echo 'opcache.fast_shutdown=1'; \
		echo 'opcache.enable_cli=1'; \
	} > /usr/local/etc/php/conf.d/opcache-recommended.ini


#Copy configuration
COPY ../../conf/timezone /etc/timezone
COPY ../../conf/php.ini /usr/local/etc/php/
ADD  ../../conf/pagespeed.conf /etc/apache2/mods-enabled/pagespeed.conf
COPY ../../www/empty /var/www/html

WORKDIR /var/www/html

EXPOSE 80