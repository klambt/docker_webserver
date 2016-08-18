#!/bin/bash
if [ "$INSTALL_COMPOSER" = 1 ]; then
    echo '#############################################'
    echo '#          INSTALL PHP Composer             #'
    echo '#                                           #'
    echo '#  This can be disabled during build with:  #'
    echo '#  -e "INSTALL_COMPOSER=0"                  #'
    echo '#                                           #'
    echo '#############################################'

    mkdir -p /var/www/.composer
    cd /tmp/
    wget https://getcomposer.org/installer
    php installer
    mv composer.phar /usr/local/bin/composer
else
    echo ' '
    echo '#############################################'
    echo '#      NOT installing PHP Composer          #'
    echo '#                                           #'
    echo '#  This can be enabled during build with:   #'
    echo '#  -e "INSTALL_COMPOSER=1"                  #'
    echo '#                                           #'
    echo '#############################################'
    echo ' '
fi

