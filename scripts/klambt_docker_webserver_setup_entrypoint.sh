#!/bin/bash

if [ "$KLAMBT_WEBSERVER_PRODUCTION" = 1 ]; then

    echo ' '
    echo '#############################################'
    echo '#        Starting in Webserver-Mode         #'
    echo '#                Production                 #'
    echo '#############################################'
    echo ' '
else
    cp /root/docker-conf/php/php-dev.ini /etc/php/7.0/apache2/php.ini
    cp /root/docker-conf/php/php-dev.ini /etc/php/7.0/cli/php.ini 
    echo ' '
    echo '#############################################'
    echo '#        Starting in Webserver-Mode         #'
    echo '#                Developer                  #'
    echo '#############################################'
    echo ' '
fi

exec "$@"
