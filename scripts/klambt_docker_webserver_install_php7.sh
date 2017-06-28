#!/bin/bash
if [ "$INSTALL_PHP7" = 1 ]; then
    echo '#############################################'
    echo '#               INSTALL PHP7                #'
    echo '#                                           #'
    echo '#  This can be disabled during build with:  #'
    echo '#  -e "INSTALL_PHP7=0"                      #'
    echo '#                                           #'
    echo '#############################################'

    apt-get install --no-install-recommends -qy php-memcached \
                                                php-mysql \
                                                php-xml \
                                                php7.0-curl \
                                                php-uploadprogress \
                                                php7.0-mbstring \
                                                php7.0-common \
                                                php7.0-gd \
                                                php7.0-opcache \
                                                php7.0-bcmath \
                                                memcached\
                                                libapache2-mod-php

   cp /root/docker-conf/php/php-prod.ini /etc/php/7.0/apache2/php.ini

   #Composer installation
   klambt_docker_webserver_install_composer.sh
else
    echo ' '
    echo '#############################################'
    echo '#      NOT installing PHP7                  #'
    echo '#                                           #'
    echo '#  This can be enabled during build with:   #'
    echo '#  -e "INSTALL_PHP7=1"                      #'
    echo '#                                           #'
    echo '#############################################'
    echo ' '
fi


