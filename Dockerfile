FROM php:7.0-apache
MAINTAINER Tim Weyand <tim.weyand@klambt.de>

ENV UPDATE_DEBIAN             1
ENV INSTALL_PAGESPEED         1
ENV USE_OPCACHE_OPTIMIZATION  1
ENV USE_PHP7_MEMCACHE         1
ENV WORKDIR                   /var/www/html
ENV LANGUAGE                  de_DE.UTF-8
ENV TIMEZONE                  Europe/Berlin
ENV APACHE2_PORT              80
ENV DOWNLOAD_APP_BUILD_FROM   0
ENV DOWNLOAD_APP_RUN_FROM     0
ENV COPY_EMPTY_WWW            1
ENV SETUP_FOR_PRODUCTION      0

COPY ./conf /root/conf
COPY ./www/empty /root/empty_html
COPY ./www/private /var/www/private

COPY ./scripts/* /usr/local/bin/
RUN chmod +x /usr/local/bin/klambt_docker_*.sh \
    && /usr/local/bin/klambt_docker_setup_environment.sh  \
    && /usr/local/bin/klambt_docker_update_debian.sh \
    && /usr/local/bin/klambt_docker_install_packages.sh \
    && /usr/local/bin/klambt_docker_install_php7_memcached.sh \    
    && /usr/local/bin/klambt_docker_install_pagespeed.sh \
    && /usr/local/bin/klambt_docker_setup_opcache_optimization.sh \
    && /usr/local/bin/klambt_docker_download_application.sh \
    && /usr/local/bin/klambt_docker_production_ready.sh \
    && /usr/local/bin/klambt_docker_webserver_cleanup.sh 

WORKDIR $WORKDIR

EXPOSE $APACHE2_PORT

CMD ["/usr/local/bin/klambt_docker_webserver_start.sh"]
