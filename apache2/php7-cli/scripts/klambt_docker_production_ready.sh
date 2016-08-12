#!/bin/bash
echo ' '

if [ "$SETUP_FOR_PRODUCTION" = 1 ]; then
    echo '######################################################'
    echo '#                  !!!! CAUTION !!!!                 #'
    echo '#                                                    #'
    echo '#  This Docker is not (yet) intended for Production! #'
    echo '#                                                    #'
    echo '#                 Use at your own Risk               #'
    echo '######################################################'
    exit 1;
else
    echo '#################################################'
    echo '#       Use as a Dev/Testing System             #'
    echo '#                                               #'
    echo '#  Production can be enabled during build with: #'
    echo '#  -e "SETUP_FOR_PRODUCTION=1"                  #'
    echo '#                                               #'
    echo '#           Use at your own Risk                #'
    echo '#                                               #'
    echo '#################################################'

    cp /root/conf/php.ini /usr/local/etc/php/

    if [ "$APACHE2_PORT" != 80 ]; then
        echo "Listen $APACHE2_PORT" > /etc/apache2/ports.conf
    fi
fi